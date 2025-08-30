import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/shared/utils/result.dart';

abstract class ProfileRepository {
  Future<Result<Profile>> getProfile();
  Future<Result<Profile>> updateProfile({
    required String username,
    String? avatarUrl,
  });
}
