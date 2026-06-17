import 'package:geolocator/geolocator.dart';
import 'package:live_driving_tracking_app/data/models/locations_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/constants/app_constants.dart';

abstract class LocationDatasource {
  Future<bool> requestPermission();
  Future<LocationModel> getCurrentLocation();
  Future<LocationModel> getLocationStream();
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

  }

}