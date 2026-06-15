import 'package:flutter/material.dart';
import 'package:live_driving_tracking_app/presentation/pages/tracking_map_page.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Live Driver Tracking App",
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const TrackingMapPage(),
    );
  }
}


