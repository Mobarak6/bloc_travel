import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/data/repositories/trip/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';
part 'trip_bloc.freezed.dart';

@injectable
class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc(this.repository) : super(const TripState.initial()) {
    on<TripEvent>((event, emit) {

    });

    on<LoadTrips>(_onLoadTrips);
    on<CreateTrip>(_onCreateTrip);
  }

  final TripRepository repository;
  StreamSubscription? _subscription;

  void _onLoadTrips(LoadTrips event, Emitter<TripState> emit) {
    emit(const TripLoading());
    _subscription?.cancel();
    _subscription = repository.getTrips(
      userId: event.userId,
      isAdmin: event.isAdmin ?? false,
    ).listen((trips) {
      emit(TripLoaded(trips));

      // add(TripEvent.createTripList(trips));
    });
    // emit(TripLoaded(trips));

  }

  void _onCreateTrip(CreateTrip event, Emitter<TripState> emit) async {
    try {
      await repository.createTrip(event.trip);
    } catch (e) {
      print('=============erro---${e.toString()}');
      emit(TripState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
