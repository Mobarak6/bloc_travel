import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/auth/auth_repository.dart';
import 'package:travel_app/src/data/services/auth_service.dart';
import 'package:travel_app/src/shared/utils/result.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);
  final AuthService _authService;

  @override
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.signIn(
        email: email,
        password: password,
      );

      return Result.ok(response.user != null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> signUp({
    required String email,
    required String password,
    required String name,
    required UserRole userRole,
  }) async {
    try {
      await _authService.signUp(
        email: email,
        password: password,
        name: name,
        userRole: userRole,
      );

      return Result.ok(true);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
