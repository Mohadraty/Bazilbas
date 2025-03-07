import 'dart:async';
import 'package:bazilbas/functions/navgater_function.dart';
import 'package:flutter/material.dart';

class SplashFunction {
  bool isSplash = false;

  void animatedLogo() {
    Timer(const Duration(milliseconds: 500), () {
      isSplash = true;
    });
  }

  void skipSplash(BuildContext context, Widget screen) {
    Timer(const Duration(seconds: 4), () {
      navgaterFunction.pushReplacementNav(context, screen);
    });
  }
}

SplashFunction splashFunction = SplashFunction();
