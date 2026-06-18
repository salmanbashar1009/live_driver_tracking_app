import 'package:fpdart/fpdart.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/data/datasources/location_datasource.dart';
import 'package:live_driving_tracking_app/domain/entities/driver_location_entity.dart';
import 'package:live_driving_tracking_app/domain/repositories/location_repository.dart';


/// Implements the domain contract using the data source
/// Catches all thrown [Failure]s and wraps in [Left]

class LocationRepositoryImpl implements LocationRepository {
  final LocationDatasource dataSource;
  
  const LocationRepositoryImpl({required this.dataSource});
  
  @override
  Future<Either<Failure,bool>> requestLocationPermission()async{
    try{
      final result = await dataSource.requestPermission();
      return Right(result);
    }on Failure catch (f){
      return Left(f);
    }catch (e){
      return Left(LocationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,DriverLocationEntity>> getCurrentLocation()async{
    try{
      final model = await dataSource.getCurrentLocation();
      return Right(model);
    }on Failure catch (f){
      return Left(f);
    }catch (e){
      return Left(LocationFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure,DriverLocationEntity>> getLocationStream(){
    return dataSource.getLocationStream().map<Either<Failure,DriverLocationEntity>>((model){
      return Right(model);
    }).handleError(
        (error){
          if(error is Failure) return Left(error);
          return Left(LocationFailure(error.toString()));
        }
    );
  }
}