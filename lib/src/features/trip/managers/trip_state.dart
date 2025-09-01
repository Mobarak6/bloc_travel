part of 'trip_bloc.dart';

@freezed
class TripState with _$TripState {
  const factory TripState.initial() = TripInitial;
  const factory TripState.loading() = TripLoading;
  const factory TripState.loaded(List<Trip> trips) = TripLoaded;
  const factory TripState.error(String message) = TripError;
}
