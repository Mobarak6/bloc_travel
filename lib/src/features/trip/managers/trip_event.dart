part of 'trip_bloc.dart';

@freezed
class TripEvent with _$TripEvent {
  const factory TripEvent.loadTrips({required String userId, bool? isAdmin}) =LoadTrips;
  const factory TripEvent.tripsUpdated(List<Trip> trips) = _TripsUpdated;


}
