import 'package:bazilbas/functions/navgater_function.dart';
import 'package:bazilbas/model/onbording_modil.dart';
import 'package:bazilbas/src/app_shared.dart';
import 'package:flutter/material.dart';

class OnbordingFunction {
  bool isEnd = false;
  PageController pageController = PageController();
  int pageIndex = 0;

  void onbordingNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void onbordingSkip() {
    pageController.jumpToPage(onbordingItems.onbordingItems.length - 1);
  }

  void goToHome(BuildContext context, Widget home) {
    AppShared.localStorage.setBool('onboarded', true);
    navgaterFunction.navgaterFunction(context, home);
  }
}

OnbordingFunction onbordingFunction = OnbordingFunction();
