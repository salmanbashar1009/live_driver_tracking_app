import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/domain/entities/driver_location_entity.dart';
import 'package:live_driving_tracking_app/domain/repositories/location_repository.dart';

class GetCurrentLocation {
  final LocationRepository repository;
  const GetCurrentLocation(this.repository);

  Future<Either<Failure,DriverLocationEntity>> call() => repository.getCurrentLocation();
}