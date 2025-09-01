part of 'trip_ops_bloc.dart';

@freezed
abstract class TripOpsEvent with _$TripOpsEvent {
  const factory TripOpsEvent.createTrip(Trip trip) = _CreateTrip;
  const factory TripOpsEvent.selectDate({DateTime? start, DateTime? end}) = _SelectDate;

}
