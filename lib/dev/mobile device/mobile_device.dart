import 'package:bazilbas/dev/mobile%20device/screens/mobile_splash_screen.dart';
import 'package:flutter/material.dart';

class MobileDevice extends StatefulWidget {
  const MobileDevice({
    super.key,
  });

  @override
  State<MobileDevice> createState() => _MobileDeviceState();
}

class _MobileDeviceState extends State<MobileDevice> {
  @override
  Widget build(BuildContext context) {
    return const MobileSplashScreen();
  }
}
