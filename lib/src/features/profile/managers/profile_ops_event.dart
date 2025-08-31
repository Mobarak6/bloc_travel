part of 'profile_ops_bloc.dart';

@freezed
abstract class ProfileOpsEvent with _$ProfileOpsEvent {
  const factory ProfileOpsEvent.selectImage({
    required Profile profile,
    required String imagePath,
  }) = _SelectImage;

}
