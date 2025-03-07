import 'package:bazilbas/components/onbording_viow.dart';
import 'package:bazilbas/model/onbording_modil.dart';
import 'package:flutter/material.dart';

class OnbordingContant extends StatelessWidget {
  const OnbordingContant({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  final PageController pageController;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: onbordingItems.onbordingItems.length,
      itemBuilder: (context, index) {
        return OnbordingViow(
          index: index,
          onboardingItemsController: OnboardingItems(),
        );
      },
    );
  }
}
