import 'package:bazilbas/dev/tablet%20device/screens/tablet_splash_screen.dart';
import 'package:flutter/material.dart';

class TabletDevice extends StatefulWidget {
  const TabletDevice({
    super.key,
  });

  @override
  State<TabletDevice> createState() => _TabletDeviceState();
}

class _TabletDeviceState extends State<TabletDevice> {
  @override
  Widget build(BuildContext context) {
    return const TabletSplashScreen();
  }
}
