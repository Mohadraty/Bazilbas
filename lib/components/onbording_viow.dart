import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/model/onbording_modil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbordingViow extends StatelessWidget {
  const OnbordingViow({
    super.key,
    required this.index,
    required this.onboardingItemsController,
  });

  final int index;
  final OnboardingItems onboardingItemsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          onboardingItemsController.onbordingItems[index].image,
          height: SizeApp.screenHeight! * .30.h,
        ),
        Text(
          textAlign: TextAlign.center,
          onboardingItemsController.onbordingItems[index].titel,
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            textAlign: TextAlign.center,
            onboardingItemsController.onbordingItems[index].description,
          ),
        ),
      ],
    );
  }
}
