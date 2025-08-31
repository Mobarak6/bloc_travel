import 'dart:io';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
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

  /// Update image in Supabase storage and return the public URL
  Future<String> uploadImage(File imageFile) async {

    final currentUser = _supabase.auth.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    final fileExt = path.extension(imageFile.path);
    final fileName =
        '${currentUser.id}/avatar${DateTime.now().millisecondsSinceEpoch}$fileExt';

    await _supabase.storage
        .from('avatars')
        .upload(
      fileName,
      imageFile,
      fileOptions: const FileOptions(upsert: true),
    );


    final imageUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);

    return imageUrl;
  }


}
