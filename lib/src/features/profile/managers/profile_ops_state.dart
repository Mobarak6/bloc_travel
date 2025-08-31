part of 'profile_ops_bloc.dart';

@freezed
class ProfileOpsState with _$ProfileOpsState {
  const factory ProfileOpsState.initial() = _Initial;

  const factory ProfileOpsState.imageSelected({
    required Profile profile,
    required String selectedImagePath,
  }) = _ImageSelected;


}
