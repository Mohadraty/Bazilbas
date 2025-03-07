import 'package:bazilbas/content/splash_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/dev/tablet%20device/screens/tablet_onbording_screen.dart';
import 'package:bazilbas/functions/splash_function.dart';
import 'package:flutter/material.dart';

class TabletSplashScreen extends StatefulWidget {
  const TabletSplashScreen({super.key});

  @override
  State<TabletSplashScreen> createState() => _TabletSplashScreenState();
}

class _TabletSplashScreenState extends State<TabletSplashScreen> {
  @override
  void initState() {
    splashFunction.skipSplash(context, const TabletOnbordingScreen());
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    splashFunction.animatedLogo();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.backGround,
      body: Center(
        child: SplashContent(),
      ),
    );
  }
}
