import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';

import 'package:travel_app/src/data/repositories/auth/auth_repository.dart';
import 'package:travel_app/src/shared/utils/result.dart';

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
        userRole: event.userRole,
      );
      switch (result) {
        case Ok<bool>():
          emit(const AuthState.success());

        case Error<bool>():
          emit(AuthState.error(result.error));
      }
    });

    on<_SelectUserRole>((event, emit) {
      emit(AuthState.selectedUserRole(event.userRole));
    });
  }

  final AuthRepository authRepository;
}
