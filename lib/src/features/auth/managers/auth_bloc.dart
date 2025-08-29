import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/repositories/auth/auth_repository.dart';
import 'package:travel_app/src/shared/utils/result.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc(this.authRepository) : super(const AuthState.initial()) {

    // on<_CheckAuthUserExists>((event, emit) async {
    //   emit(const AuthState.checking());
    //   final result = await authRepository.checkAuthUserExists(event.email);
    //   print('---------------here-----(x)');
    //
    //
    //   switch (result) {
    //     case Ok<bool>():
    //       emit(const AuthState.checked());
    //     case Error<bool>():
    //       print('---------------here-----(2)');
    //
    //       emit(AuthState.error(result.error));
    //   }
    // });

    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(const AuthState.inProgress());
      final result = await authRepository.signInWithEmailAndPassword(
       email: event.email, password: event.password,
      );

      switch (result) {
        case Ok<bool>():
          emit(const AuthState.success());

        case Error<bool>():
          emit(AuthState.error(result.error));
      }

    });


    on<_SignUpWithEmailAndPassword>((event, emit) async {
      emit(const AuthState.inProgress());
      final result = await authRepository.signUpWithEmailAndPassword(
        email: event.email, password: event.password,
      );
      switch (result) {
        case Ok<bool>():
          emit(const AuthState.success());

        case Error<bool>():
          emit(AuthState.error(result.error));
    }});

  }


  final AuthRepository authRepository;
}
