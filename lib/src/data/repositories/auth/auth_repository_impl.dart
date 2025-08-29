
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/repositories/auth/auth_repository.dart';
import 'package:travel_app/src/data/services/auth_service.dart';
import 'package:travel_app/src/shared/utils/result.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);
  final AuthService _authService;

  @override
  Future<Result<bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.signInWithEmailAndPassword(
        email: email, password: password,
      );

      return Result.ok(response.user != null);

    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.signUpWithEmail(email: email, password: password);

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

