import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/profile/profile_repository.dart';
import 'package:travel_app/src/data/models/response.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(const ProfileState.initial()) {
    on<_LoadProfile>(_onLoadProfile);
  }

  final ProfileRepository profileRepository;

  Future<void> _onLoadProfile(
    _LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await profileRepository.getProfile();

    switch (result) {
      case Success<Profile>():
        emit(ProfileState.loaded(result.value));

      case Error<Profile>():
        emit(ProfileState.error(result.error.toString()));
    }
  }


}
