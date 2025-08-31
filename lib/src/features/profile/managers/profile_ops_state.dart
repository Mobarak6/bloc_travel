part of 'profile_ops_bloc.dart';

@freezed
class ProfileOpsState with _$ProfileOpsState {
  const factory ProfileOpsState.initial() = _Initial;

  const factory ProfileOpsState.updating() = _Updating;
  const factory ProfileOpsState.updated(Profile profile) = _Updated;
  const factory ProfileOpsState.error(String message) = _Error;

  const factory ProfileOpsState.imageSelected({
    required String selectedImagePath,
  }) = _ImageSelected;

}
