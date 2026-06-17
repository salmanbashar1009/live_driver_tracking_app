import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/core/usecases/usecase.dart';
import 'package:live_driving_tracking_app/domain/entities/driver_location_entity.dart';

import '../repositories/location_repository.dart';

class GetLocationStream implements StreamUseCase<DriverLocationEntity,NoParams> {
  final LocationRepository repository;
  const GetLocationStream(this.repository);

  @override
  Stream<Either<Failure,DriverLocationEntity>> call(NoParams params) => repository.getLocationStream();
}