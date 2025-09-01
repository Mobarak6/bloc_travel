import 'package:injectable/injectable.dart';
import 'package:travel_app/src/data/models/response.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/data/repositories/trip/trip_repository.dart';
import 'package:travel_app/src/data/services/trip_service.dart';

@LazySingleton(as: TripRepository)
class TripRepositoryImpl implements TripRepository {
  TripRepositoryImpl(this._tripService);
  final TripService _tripService;

  @override
  Stream<Response<List<Trip>>> getTrips({required String userId, bool isAdmin = false}) {
    try {
      return _tripService.getTrips(userId: userId, isAdmin: isAdmin).map((data) {
        final trips = data.map(Trip.fromJson).toList();
        return Response.success(trips);
      });
    } catch (e) {
      return Stream.value(Response.error(Exception(e.toString())));
    }
  }

  @override
  Future<Response<bool>> createTrip(Trip trip) async {
    try {
      await _tripService.createTrip({
        'user_id': trip.userId,
        'destination': trip.destination,
        'start_date': trip.startDate?.toIso8601String(),
        'end_date': trip.endDate?.toIso8601String(),
        'description': trip.description,
        'trip_image_url': trip.tripImageUrl,
      });
      return Response.success(true);
    } on Exception catch (e) {
      return Response.error(e);
    }
  }
}
