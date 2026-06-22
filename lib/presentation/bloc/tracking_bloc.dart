import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';
import 'package:live_driving_tracking_app/domain/usecases/get_location_stream.dart';
import 'package:live_driving_tracking_app/domain/usecases/request_location_permission.dart';
import 'package:live_driving_tracking_app/presentation/bloc/tracking_event.dart';
import 'package:live_driving_tracking_app/presentation/bloc/tracking_state.dart';

import '../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_location.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState>{
  final RequestLocationPermission _requestLocationPermission;
  final GetLocationStream _getLocationStream;

  StreamSubscription<dynamic>? _locationSubscription;

  TrackingBloc({
    required RequestLocationPermission requestLocationPermission,
    required GetLocationStream getLocationStream,
}) : _requestLocationPermission = requestLocationPermission,
     _getLocationStream = getLocationStream,
    super(const TrackingInitial()){
    on<TrackingStarted>(_onTrackingStarted);
  }

  //=======================
  // Handlers
  // =====================

  Future<void> _onTrackingStarted(
      TrackingStarted event,
      Emitter<TrackingState> emit,
      )async{
    emit(const TrackingLoading());

    // request/verify permission
    final permResult = await _requestLocationPermission(NoParams());
    final permissionFailed = permResult.fold((failure){
      if(failure is PermissionPermanentlyDeniedFailure){
        emit(const TrackingPermissionPermanentlyDenied());
      }else if (failure is LocationServiceDisabledFailure){
        emit(const TrackingServiceDisable());
      }else {
        emit(const TrackingPermissionDenied());
      }
      return true;
    }, (success) => false);

    if(permissionFailed) return;

    // subscribe to the live location stream
    await _locationSubscription?.cancel();
    _locationSubscription = _getLocationStream(NoParams()).listen((either){
      either.fold(
          (failure) => add(TrackingLocationError(failure)),
          (location) => add(TrackLocationUpdated(location))
      );
    });
  }


}