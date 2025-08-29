import 'package:travel_app/src/shared/utils/result.dart';

abstract class AuthRepository {
  Future<Result<bool>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  });

  Future<Result<bool>> signOut();
}
