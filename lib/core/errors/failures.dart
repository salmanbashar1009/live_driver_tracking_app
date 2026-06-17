import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Local storage error', super.code});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Server error', super.code});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Resource not found', super.code});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message = 'Unexpected error', super.code});
}

// ── New Location & Permission Failures ─────────────────────────────────

class LocationServiceDisabledFailure extends Failure {
  const LocationServiceDisabledFailure()
      : super(message: 'Location services are disabled');
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure()
      : super(message: 'Location permission denied');
}

class PermissionPermanentlyDeniedFailure extends Failure {
  const PermissionPermanentlyDeniedFailure()
      : super(message: 'Location permission permanently denied');
}

class LocationFailure extends Failure {
  const LocationFailure(String message)
      : super(message: message);
}