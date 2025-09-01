import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/response.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/data/repositories/trip/trip_repository.dart';
import 'package:travel_app/src/features/trip/managers/trip_bloc.dart';

part 'trip_ops_event.dart';
part 'trip_ops_state.dart';
part 'trip_ops_bloc.freezed.dart';

@injectable
class TripOpsBloc extends Bloc<TripOpsEvent, TripOpsState> {
  TripOpsBloc(this.repository) : super(const TripOpsState.initial()) {
    on<_CreateTrip>(_onCreateTrip);

  }

  final TripRepository repository;


  Future<void> _onCreateTrip(_CreateTrip event, Emitter<TripOpsState> emit) async {
    emit(const TripOpsState.inProgress());

    final response =  await repository.createTrip(event.trip);


    switch (response) {
      case Success<bool>():
        emit(const TripOpsState.success());

      case Error<bool>():
        emit(TripOpsState.error(response.error));
    }


  }

}
