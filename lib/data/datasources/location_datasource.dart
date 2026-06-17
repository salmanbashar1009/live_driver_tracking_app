import 'package:geolocator/geolocator.dart';
import 'package:live_driving_tracking_app/data/models/locations_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/constants/app_constants.dart';
import '../../core/errors/failures.dart';

abstract class LocationDatasource {
  Future<bool> requestPermission();
  Future<LocationModel> getCurrentLocation();
  Stream<LocationModel> getLocationStream();
}

class LocationDataSourceImpl implements LocationDatasource{
  /// geolocator settings
  static final LocationSettings _locationSettings = LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: AppConstants.locationDistanceFilterMeters.toInt(),
  );

  @override
  Future<bool> requestPermission() async{
    /// check if location services are enabled at the OS level
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      throw const LocationServiceDisabledException();
    }

    /// check current permission status via permission_handler for richer states
    final status = await Permission.locationWhenInUse.status;

    if(status.isGranted) return true;

    if(status.isPermanentlyDenied){
      throw const PermissionPermanentlyDeniedFailure();
    }
    /// actually request permission
    final result = await Permission.locationWhenInUse.request();
    if(result.isGranted) return true;
    if(result.isPermanentlyDenied){
      throw const PermissionPermanentlyDeniedFailure();
    }
    throw const PermissionDeniedFailure();
  }

  @override
  Future<LocationModel> getCurrentLocation() async{
    try{
      final position = await Geolocator.getCurrentPosition(
          locationSettings: _locationSettings
      );
      return LocationModel.fromPosition(position);
    }on LocationServiceDisabledException{
      throw const LocationServiceDisabledFailure();
    }on PermissionDeniedException{
      throw const PermissionDeniedFailure();
    }catch(e){
      throw  LocationFailure(e.toString());
    }
  }

  @override
  Stream<LocationModel> getLocationStream(){
    return Geolocator.getPositionStream(
      locationSettings: _locationSettings,
    ).map((position)=> LocationModel.fromPosition(position));
  }

}