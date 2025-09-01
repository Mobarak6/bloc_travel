import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/profile_model.dart';
import 'package:travel_app/src/data/repositories/profile/profile_repository.dart';
import 'package:travel_app/src/data/models/response.dart';

part 'profile_ops_event.dart';
part 'profile_ops_state.dart';
part 'profile_ops_bloc.freezed.dart';

@injectable
class ProfileOpsBloc extends Bloc<ProfileOpsEvent, ProfileOpsState> {
  ProfileOpsBloc(this.profileRepository) : super(const ProfileOpsState.initial()) {
    on<_SelectImage>(_onSelectImage);
    on<_UpdateProfile>(_onUpdateProfile);
  }

  final ProfileRepository profileRepository;

  void _onSelectImage(
    _SelectImage event,
    Emitter<ProfileOpsState> emit,
  ) {
    emit(
      ProfileOpsState.imageSelected(
        selectedImagePath: event.imagePath,
      ),
    );
  }

  Future<void> _onUpdateProfile(
      _UpdateProfile event,
      Emitter<ProfileOpsState> emit,
      ) async {
    emit(const ProfileOpsState.updating());

    final result = await profileRepository.updateProfile(
      username: event.username,
      avatarUrl: event.avatarUrl,
    );

    switch (result) {
      case Success<Profile>():
        emit(ProfileOpsState.updated(result.value));

      case Error<Profile>():
        emit(ProfileOpsState.error(result.error.toString()));
    }
  }

}
