import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/auth/auth_repository.dart';
import 'package:travel_app/src/data/services/auth_service.dart';
import 'package:travel_app/src/data/models/response.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);
  final AuthService _authService;

  @override
  Future<Response<bool>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.signIn(
        email: email,
        password: password,
      );

      return Response.success(response.user != null);
    } on Exception catch (e) {
      return Response.error(e);
    }
  }

  @override
  Future<Response<bool>> signUp({
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

      return Response.success(true);
    } on Exception catch (e) {
      return Response.error(e);
    }
  }

  @override
  Future<Response<bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
