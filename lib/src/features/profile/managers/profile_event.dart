part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = _LoadProfile;

  const factory ProfileEvent.updateProfile({
    required String username,
    String? avatarUrl,
  }) = _UpdateProfile;

  const factory ProfileEvent.selectImage({
    required String imagePath,
  }) = _SelectImage;

  const factory ProfileEvent.updateImage({
    required String imagePath,
  }) = _UpdateImage;
}
