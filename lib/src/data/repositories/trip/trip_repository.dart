import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';

@lazySingleton // or @singleton if you want
class TripRepository {
  final SupabaseClient supabase;

  TripRepository(this.supabase);

  // Stream trips in real-time
  Stream<List<Trip>> getTrips({required String userId, bool isAdmin = false}) {
    final query = supabase
        .from('trips')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false);

    return query.map((event) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(event);
      if (!isAdmin) {
        data.removeWhere((trip) => trip['user_id'] != userId);
      }
      return data.map((e) => Trip.fromJson(e)).toList();
    });
  }

  // Create a new trip
  Future<void> createTrip(Trip trip) async {
    await supabase.from('trips').insert({
      'user_id': trip.userId,
      'destination': trip.destination,
      'start_date': trip.startDate?.toIso8601String(),
      'end_date': trip.endDate?.toIso8601String(),
      'description': trip.description,
      'trip_image_url': trip.tripImageUrl,
    });
  }
}
