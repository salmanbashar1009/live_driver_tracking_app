class AppConstants {
  AppConstants._();

  // ──────────────────────────────────────────────
  // 🔑  Replace with your real Google Maps API key
  // ──────────────────────────────────────────────
  static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';

  // location accuracy and update settings
  static const int locationUpdateIntervalMs = 1000; // 1 second
  static const double locationDistanceFilterMeters = 3.0;
  static const double defaulZoomLevel = 16.5;
  static const double markerAnimationDurationMs = 800; // 0.8 second

  // map style (dark ride-sharing style)
  static const String darkMapStyle = '''
  [
    {"elementType": "geometry", "stylers": [{"color": "#1d2c4d"}]},
    {"elementType": "labels.text.fill", "stylers": [{"color": "#8ec3b9"}]},
    {"elementType": "labels.text.stroke", "stylers": [{"color": "#1a3646"}]},
    {
      "featureType": "administrative.country",
      "elementType": "geometry.stroke",
      "stylers": [{"color": "#4b6878"}]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [{"color": "#304a7d"}]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [{"color": "#255763"}]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [{"color": "#98a5be"}]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [{"color": "#2c6675"}]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [{"color": "#0e1626"}]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [{"color": "#283d6a"}]
    }
  ]
  ''';
}