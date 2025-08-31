import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/profile/profile_repository.dart';
import 'package:travel_app/src/data/services/profile_service.dart';
import 'package:travel_app/src/shared/utils/result.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profileService);
  final ProfileService _profileService;

  @override
  Future<Result<Profile>> getProfile() async {
    try {
      final response = await _profileService.getProfile();
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
      String? uploadedAvatarUrl;

      // Handle image upload if a local file path is provided
      if (avatarUrl != null) {
        final imageFile = File(avatarUrl);

        uploadedAvatarUrl = await _profileService.uploadImage(imageFile);

      }

      final response = await _profileService.updateProfile(
        username: username,
        avatarUrl: uploadedAvatarUrl,
      );

      final profile = Profile.fromJson(response);
      return Result.ok(profile);

    } on Exception catch (e) {
      return Result.error(e);
    }
  }

}
