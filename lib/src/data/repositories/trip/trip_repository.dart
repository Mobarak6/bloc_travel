import 'package:travel_app/src/data/models/response.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';

abstract class TripRepository {
  Stream<Response<List<Trip>>> getTrips({required String userId});
  Future<Response<bool>> createTrip(Trip trip);
}
