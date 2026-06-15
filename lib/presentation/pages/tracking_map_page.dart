import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class TrackingMapPage extends StatefulWidget {
  const TrackingMapPage({super.key});

  @override
  State<TrackingMapPage> createState() => _TrackingMapPageState();
}

class _TrackingMapPageState extends State<TrackingMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track your rider'),
        backgroundColor: AppTheme.darkSurface,
        centerTitle: false,
      ),
      body: Center(child: Text('Tracking Map Page'),),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}
