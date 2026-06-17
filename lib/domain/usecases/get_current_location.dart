import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/core/usecases/usecase.dart';
import 'package:live_driving_tracking_app/domain/entities/driver_location_entity.dart';
import 'package:live_driving_tracking_app/domain/repositories/location_repository.dart';

class GetCurrentLocation implements UseCase<DriverLocationEntity,NoParams>{
  final LocationRepository repository;
  const GetCurrentLocation(this.repository);

  @override
  Future<Either<Failure,DriverLocationEntity>> call(NoParams params) => repository.getCurrentLocation();
}