import 'package:travel_app/src/data/models/profile_model.dart';

import 'package:travel_app/src/data/models/response.dart';

abstract class AuthRepository {
  Future<Response<bool>> signUp({
    required String email,
    required String password,
    required String name,
    required UserRole userRole,
  });
  Future<Response<bool>> signIn({
    required String email,
    required String password,
  });

  Future<Response<bool>> signOut();
}
