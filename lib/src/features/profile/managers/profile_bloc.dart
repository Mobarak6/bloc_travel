import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/profile/profile_repository.dart';
import 'package:travel_app/src/shared/utils/result.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(const ProfileState.initial()) {
    on<_LoadProfile>(_onLoadProfile);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_SelectImage>(_onSelectImage);
    on<_UpdateImage>(_onUpdateImage);
  }

  final ProfileRepository profileRepository;

  Future<void> _onLoadProfile(
    _LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await profileRepository.getProfile();

    switch (result) {
      case Ok<Profile>():
        emit(ProfileState.loaded(result.value));
      case Error<Profile>():
        emit(ProfileState.error(result.error.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    _UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.updating());

    final result = await profileRepository.updateProfile(
      username: event.username,
      avatarUrl: event.avatarUrl,
    );

    switch (result) {
      case Ok<Profile>():
        emit(ProfileState.updated(result.value));
      case Error<Profile>():
        emit(ProfileState.error(result.error.toString()));
    }
  }

  void _onSelectImage(
    _SelectImage event,
    Emitter<ProfileState> emit,
  ) {
    final currentState = state;
    if (currentState is _Loaded) {
      emit(
        ProfileState.imageSelected(
          profile: currentState.profile,
          selectedImagePath: event.imagePath,
        ),
      );
    }
  }

  Future<void> _onUpdateImage(
    _UpdateImage event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.updating());

    final result = await profileRepository.updateImage(event.imagePath);

    switch (result) {
      case Ok<String>():
        // After successful image upload, reload the profile to get updated data
        final profileResult = await profileRepository.getProfile();
        switch (profileResult) {
          case Ok<Profile>():
            emit(ProfileState.updated(profileResult.value));
          case Error<Profile>():
            emit(ProfileState.error(profileResult.error.toString()));
        }
      case Error<String>():
        emit(ProfileState.error(result.error.toString()));
    }
  }
}
