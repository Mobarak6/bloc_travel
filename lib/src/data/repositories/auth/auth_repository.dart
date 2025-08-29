
import 'package:travel_app/src/shared/utils/result.dart';

abstract class AuthRepository {
  Future<Result<bool>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Result<bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<bool>> signOut();





}
