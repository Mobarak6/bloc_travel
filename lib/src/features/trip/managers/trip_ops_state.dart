part of 'trip_ops_bloc.dart';

@freezed
class TripOpsState with _$TripOpsState {
  const factory TripOpsState.initial() = _Initial;
  const factory TripOpsState.inProgress() = _InProgress;
  const factory TripOpsState.success() = _Success;
  const factory TripOpsState.selectedDate({DateTime? start, DateTime? end}) = _SelectedDate;
  const factory TripOpsState.error(Exception? e) = _Error;
}
