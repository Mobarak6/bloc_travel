import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/src/data/models/profile_model.dart';

@lazySingleton
class ProfileService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Get profile data from Supabase
  Future<Map<String, dynamic>> getProfile() async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final response = await _supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return response;
  }

  /// Update profile data in Supabase
  Future<Map<String, dynamic>> updateProfile({
    required String username,
    String? avatarUrl,
  }) async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final updateData = <String, dynamic>{
      'username': username,
    };

    if (avatarUrl != null) {
      updateData['avatar_url'] = avatarUrl;
    }

    final response = await _supabase
        .from('profiles')
        .update(updateData)
        .eq('id', user.id)
        .select()
        .single();

    return response;
  }

  /// Upload image to Supabase storage and return the public URL
  Future<String?> uploadImage({
    required String filePath,
    required String bucketName,
    String? fileName,
  }) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('File does not exist: $filePath');
    }

    // Generate unique filename if not provided
    final uniqueFileName = fileName ?? 
        '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

    // Upload file to storage
    await _supabase.storage
        .from(bucketName)
        .upload(uniqueFileName, file);

    // Get public URL
    final publicUrl = _supabase.storage
        .from(bucketName)
        .getPublicUrl(uniqueFileName);

    return publicUrl;
  }
}
