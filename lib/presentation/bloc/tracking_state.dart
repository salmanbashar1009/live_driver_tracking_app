import 'package:equatable/equatable.dart';

import '../../domain/entities/driver_location_entity.dart';

abstract class TrackingState extends Equatable {
  const TrackingState();
  @override
  List<Object?> get props => [];
}

/// App just launched - waiting for permission check to complete
class TrackingInitial extends TrackingState {
  const TrackingInitial();
}

/// permission request/ initial GPS fix in progress
class TrackingLoading extends TrackingState {
  const TrackingLoading();
}

/// location updates are flowing normally
class TrackingActive extends TrackingState {
  final DriverLocationEntity location;
  const TrackingActive({required this.location});
  @override
  List<Object?> get props => [location];
}

/// non fata error (e.g. momentary GPS loss) - ma stays visible
class TrackingError extends TrackingState {
  final String message;
  final DriverLocationEntity? lastKnownLocation; // keep map alive if we had a fix
  const TrackingError({required this.message, this.lastKnownLocation});

  @override
  List<Object?> get props => [message, lastKnownLocation];
}

/// user denied permission - show prompt UI
class TrackingPermissionDenied extends TrackingState {
  const TrackingPermissionDenied();
}

/// user permanently denied permission - show prompt UI
class TrackingPermissionPermanentlyDenied extends TrackingState {
  const TrackingPermissionPermanentlyDenied();
}

/// GPS is turned off at OS level
class TrackingServiceDisable extends TrackingState{
  const TrackingServiceDisable();
}

