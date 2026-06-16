// lib/data/models/location_model.dart

import 'package:geolocator/geolocator.dart';

import '../../domain/entities/driver_location_entity.dart';

/// Data-layer model that knows how to map a [Position] (from geolocator)
/// into the domain [DriverLocation] entity.
class LocationModel extends DriverLocationEntity {
  const LocationModel({
    required super.latitude,
    required super.longitude,
    super.accuracy,
    super.speed,
    super.heading,
    required super.timestamp,
  });

  /// Converts a geolocator [Position] into our domain entity.
  factory LocationModel.fromPosition(Position position) {
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      speed: position.speed,
      heading: position.heading,
      timestamp: position.timestamp,
    );
  }
}