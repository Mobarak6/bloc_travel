part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  // const factory AuthEvent.checkAuthUserExist(String email) = _CheckAuthUserExist;

  const factory AuthEvent.signInWithEmailAndPassword({
    required String email, required String password,
  }) = _SignInWithEmailAndPassword;

  const factory AuthEvent.signUpWithEmailAndPassword({
    required String email, required String password,
  }) = _SignUpWithEmailAndPassword;






}
