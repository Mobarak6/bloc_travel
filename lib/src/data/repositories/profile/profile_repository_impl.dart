import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/profile/profile_repository.dart';
import 'package:travel_app/src/shared/utils/result.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<Result<Profile>> getProfile() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) {
        return Result.error(Exception('User not authenticated'));
      }

      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      final profile = Profile.fromJson(response);
      return Result.ok(profile);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Profile>> updateProfile({
    required String username,
    String? avatarUrl,
  }) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) {
        return Result.error(Exception('User not authenticated'));
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

      final profile = Profile.fromJson(response);
      return Result.ok(profile);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
