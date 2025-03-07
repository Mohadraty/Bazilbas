import 'package:bazilbas/functions/splash_function.dart';
import 'package:bazilbas/themes/theme_animated_text.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/themes/theme_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ThemeAnimatedWidget(
            fistChild: Image(
              image: AssetImage(IconApp.logoApp),
              width: 200.w,
              color: ColorApp.primaryHeavy,
            ),
            secondChild: Image(
              image: AssetImage(IconApp.logoApp),
              width: 70.w,
              color: ColorApp.primaryHeavy,
            ),
            isAnimated: splashFunction.isSplash,
          ),
          ThemeAnimatedWidget(
            fistChild: const SizedBox(),
            secondChild: const ThemeAnimatedText(text: "BazilBas"),
            isAnimated: splashFunction.isSplash,
          )
        ],
      ),
    );
  }
}
