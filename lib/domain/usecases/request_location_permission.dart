import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/core/usecases/usecase.dart';
import 'package:live_driving_tracking_app/domain/repositories/location_repository.dart';

class RequestLocationPermission implements UseCase<bool,NoParams> {
  final LocationRepository repository;
  const RequestLocationPermission(this.repository);

  @override
  Future<Either<Failure,bool>> call(NoParams params) => repository.requestLocationPermission();
}