import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

DateTime? _fromJson(String? date) => date == null ? null : DateTime.parse(date);
String? _toJson(DateTime? date) => date?.toIso8601String();

@freezed
abstract class Trip with _$Trip {
  const Trip._(); // For custom getters

  const factory Trip({
    String? id,
    String? userId,
    String? destination,
    @JsonKey(name: 'start_date', fromJson: _fromJson, toJson: _toJson) DateTime? startDate,
    @JsonKey(name: 'end_date', fromJson: _fromJson, toJson: _toJson) DateTime? endDate,
    String? description,
    @JsonKey(name: 'trip_image_url') String? tripImageUrl,
    @JsonKey(name: 'created_at', fromJson: _fromJson, toJson: _toJson) DateTime? createdAt,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  // Mock trip data
  factory Trip.mockTrip() => Trip(
    id: "123e4567-e89b-12d3-a456-426614174000",
    userId: "770bbbde-e928-4912-b7a9-f4abccdcc292",
    destination: "Paris, France",
    startDate: DateTime.parse("2025-09-01"),
    endDate: DateTime.parse("2025-09-07"),
    description: "Vacation with family",
    tripImageUrl: null,
    createdAt: DateTime.parse("2025-08-29 19:20:03.306416+00"),
  );

  // Custom formatted getters
  String get formattedStartDate =>
      startDate != null ? "${startDate!.month.toString().padLeft(2,'0')}/${startDate!.day.toString().padLeft(2,'0')}/${startDate!.year}" : '';

  String get formattedEndDate =>
      endDate != null ? "${endDate!.month.toString().padLeft(2,'0')}/${endDate!.day.toString().padLeft(2,'0')}/${endDate!.year}" : '';
}
