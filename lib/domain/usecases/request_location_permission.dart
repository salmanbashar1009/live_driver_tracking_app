import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/domain/repositories/location_repository.dart';

class RequestLocationPermission {
  final LocationRepository repository;
  const RequestLocationPermission(this.repository);

  Future<Either<Failure,bool>> call() => repository.requestLocationPermission();
}