import 'package:equatable/equatable.dart';
import 'package:live_driving_tracking_app/core/errors/failures.dart';

import '../../domain/entities/driver_location_entity.dart';

abstract class TrackingEvent extends Equatable {
  const TrackingEvent();

  @override
  List<Object?> get props => [];
}


/// Fired once when the map screen mounts - bootstraps permission + initial fix
class TrackingStarted extends TrackingEvent {
  const TrackingStarted();
}

/// Fired when the user taps "open settings' on the permanent-denial screen
class TrackingOpenSettingsRequested extends TrackingEvent{
  const TrackingOpenSettingsRequested();
}

/// Internal event emitted each time geolocator updates the location
class TrackLocationUpdated extends TrackingEvent{
  final DriverLocationEntity location;
  const TrackLocationUpdated(this.location);
  @override
  List<Object?> get props => [location];
}

class TrackingLocationError extends TrackingEvent{
  final Failure failure;
  const TrackingLocationError(this.failure);
  @override
  List<Object?> get props => [failure];

}