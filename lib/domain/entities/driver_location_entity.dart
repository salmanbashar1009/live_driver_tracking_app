import 'package:equatable/equatable.dart';

class DriverLocationEntity extends Equatable {
  final double latitude;
  final double longitude;
  final double? accuracy;
  final double? speed;
  final double? heading;
  final DateTime timestamp;

  const DriverLocationEntity({
    required this.latitude,
    required this.longitude,
    this.accuracy,
    this.speed,
    this.heading,
    required this.timestamp,
  });

  /// Human readable coordinate string shown in the overlay card.
  String get formattedCoordinate =>
      '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';

  /// speed in km/h (null safe)
  double get speedKmh => ((speed ?? 0) * 3.6);

  @override
  List<Object?> get props => [latitude, longitude, accuracy, speed, heading, timestamp];
}

