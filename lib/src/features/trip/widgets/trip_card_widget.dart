import 'package:flutter/material.dart';
import 'package:travel_app/src/data/models/trip/trip_model.dart';
import 'package:travel_app/src/shared/utils/dimensions.dart';

class TripCardWidget extends StatelessWidget {
  const TripCardWidget({super.key, required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.spacingDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Destination
            Text(
              trip.destination ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            /// Description
            if (trip.description != null && trip.description!.isNotEmpty)
              Text(
                trip.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

            const SizedBox(height: 12),

            /// Dates
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 6),
                Text(
                  '${trip.formattedStartDate} → ${trip.formattedEndDate}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
