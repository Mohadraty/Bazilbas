import 'package:bazilbas/dev/desktop%20device/screens/desktop_splash.dart';
import 'package:flutter/material.dart';

class DesktopDevice extends StatefulWidget {
  const DesktopDevice({
    super.key,
  });

  @override
  State<DesktopDevice> createState() => _DesktopDeviceState();
}

class _DesktopDeviceState extends State<DesktopDevice> {
  @override
  Widget build(BuildContext context) {
    return const DesktopSplash();
  }
}
