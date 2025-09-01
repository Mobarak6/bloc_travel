import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/models/response.dart';

abstract class ProfileRepository {
  Future<Response<Profile>> getProfile();
  Future<Response<Profile>> updateProfile({
    required String username,
    String? avatarUrl,
  });
}
