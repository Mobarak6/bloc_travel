part of 'profile_ops_bloc.dart';

@freezed
abstract class ProfileOpsEvent with _$ProfileOpsEvent {
  const factory ProfileOpsEvent.selectImage({
    required String imagePath,
  }) = _SelectImage;

  const factory ProfileOpsEvent.updateProfile({
    required String username,
    String? avatarUrl,
  }) = _UpdateProfile;

}
