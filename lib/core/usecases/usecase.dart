import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';

abstract class Usecase<T,P>{
  Future<Either<Failure,T>> call(P params);
}

class NoParams{
  const NoParams();
}