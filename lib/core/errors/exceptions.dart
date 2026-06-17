class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Cache operation failed']);
}

class ServerException implements Exception {
  final String message;
  final int? statusCode;
  const ServerException([this.message = 'Server error', this.statusCode]);
}

class NoConnectionException implements Exception {
  const NoConnectionException();
}

// ── New Location & Permission Exceptions ───────────────────────────────

class LocationServiceDisabledException implements Exception {
  const LocationServiceDisabledException();
}

class PermissionDeniedException implements Exception {
  const PermissionDeniedException();
}

class PermissionPermanentlyDeniedException implements Exception {
  const PermissionPermanentlyDeniedException();
}