import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/repositories/auth/auth_repository.dart';
import 'package:travel_app/src/shared/utils/result.dart';
import 'package:travel_app/src/shared/utils/user_type.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthState.initial()) {
    on<_SignIn>((event, emit) async {
      emit(const AuthState.inProgress());
      final result = await authRepository.signIn(
        email: event.email,
        password: event.password,
      );

      switch (result) {
        case Ok<bool>():
          emit(const AuthState.success());

        case Error<bool>():
          emit(AuthState.error(result.error));
      }
    });

    on<_SignUp>((event, emit) async {
      emit(const AuthState.inProgress());
      final result = await authRepository.signUp(
        email: event.email,
        password: event.password,
        name: event.name,
        userType: event.userType,
      );
      switch (result) {
        case Ok<bool>():
          emit(const AuthState.success());

        case Error<bool>():
          emit(AuthState.error(result.error));
      }
    });

    on<_SelectUserType>((event, emit) {
      emit(AuthState.selectedUserType(event.userType));
    });
  }

  final AuthRepository authRepository;
}
