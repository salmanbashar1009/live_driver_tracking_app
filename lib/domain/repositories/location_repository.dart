import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/domain/entities/driver_location_entity.dart';

abstract class LocationRepository {
  /// Request/verify location permission
  /// Returns [Right(true)] when granted, [Left(false)] otherwise
  Future<Either<Failure,bool>> requestLocationPermission();

  /// one shot fetch of the current position
  Future<Either<Failure,DriverLocationEntity>> getCurrentLocation();

  /// Continuous stream of location updates
  Stream<Either<Failure,DriverLocationEntity>> getLocationStream();
}
