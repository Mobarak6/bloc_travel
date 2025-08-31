import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/app_di.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/features/trip/managers/trip_bloc.dart';
import 'package:travel_app/src/features/trip/screens/create_trip_screen.dart';
import 'package:travel_app/src/travel_ap_router.gr.dart';

@RoutePage()
class TripListScreen extends StatefulWidget {

  const TripListScreen({required this.userId, super.key, this.isAdmin = false});
  final String userId;
  final bool isAdmin;

  @override
  State<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends State<TripListScreen> {

  late final TripBloc _tripBloc;

  @override
  void initState() {
    _tripBloc = getIt<TripBloc>();
    _tripBloc.add(TripEvent.loadTrips(userId: widget.userId, isAdmin: widget.isAdmin));


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => _tripBloc,
  child: Scaffold(
      appBar: AppBar(title: const Text('Trips')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushRoute(CreateTripRoute(userId: widget.userId));
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TripBloc, TripState>(
        bloc: _tripBloc,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (trips) => ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) => TripTile(trip: trips[index]),
            ),
            error: (msg) => Center(child: Text('Error: $msg')),
          );
        },
      ),
    ),
);
  }
}

class TripTile extends StatelessWidget {
  const TripTile({required this.trip, super.key});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(trip.destination ?? ''),
        subtitle: Text('${trip.startDate?.toLocal()} - ${trip.endDate?.toLocal()}'),
      ),
    );
  }
}
