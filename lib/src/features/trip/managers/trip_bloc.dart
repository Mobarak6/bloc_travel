import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/response.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/data/repositories/trip/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';
part 'trip_bloc.freezed.dart';

@injectable
class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc(this.repository) : super(const TripState.initial()) {
    on<LoadTrips>(_onLoadTrips);
    on<_TripsUpdated>(_onTripsUpdated);
  }

  final TripRepository repository;
  StreamSubscription<Response<List<Trip>>>? _subscription;

  void _onTripsUpdated(_TripsUpdated event, Emitter<TripState> emit) {
    emit(TripState.loaded(event.trips));
  }

  Future<void> _onLoadTrips(LoadTrips event, Emitter<TripState> emit) async {
    emit(const TripState.loading());

    _subscription = repository.getTrips(userId: event.userId, isAdmin: event.isAdmin ?? false)
        .listen(
          (response) {
        switch (response) {
          case Success<List<Trip>>(:final value):
            add(TripEvent.tripsUpdated(value));
          case Error<List<Trip>>(:final error):
            emit(TripState.error(error.toString()));
        }
      },
    );
  }


  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
