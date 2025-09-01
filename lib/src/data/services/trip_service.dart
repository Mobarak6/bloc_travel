import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';

@lazySingleton
class TripService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Stream trips in real-time
  Stream<List<Map<String, dynamic>>> getTrips({required String userId, bool isAdmin = false}) {
    final query = _supabase
        .from('trips')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false);

    return query.map((event) {
      final data = List<Map<String, dynamic>>.from(event);
      if (!isAdmin) {
        data.removeWhere((trip) => trip['user_id'] != userId);
      }
      return data;
    });
  }

  /// Create a new trip
  Future<void> createTrip(Map<String, dynamic> tripData) async {
    await _supabase.from('trips').insert(tripData);
  }
}
