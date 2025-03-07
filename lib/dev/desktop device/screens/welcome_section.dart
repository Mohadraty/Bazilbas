import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScshen extends StatelessWidget {
  const WelcomeScshen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        width: SizeApp.screenWidth! * 1,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to BazilBas Store",
              style: TextStyle(
                fontFamily: FontApp.description,
                fontSize: 9.w,
                fontWeight: FontWeight.bold,
                color: ColorApp.title,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Discover a world of amazing products and genuine reviews. Let your shopping adventure start here.",
              style: TextStyle(
                fontFamily: FontApp.supTitel,
                fontSize: 5.w,
                fontWeight: FontWeight.bold,
                color: ColorApp.title,
              ),
            ),
            Row(
              children: [
                Text(
                  "Available with us : ",
                  style: TextStyle(
                    fontFamily: FontApp.titel,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  pause: const Duration(milliseconds: 500),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'clothes',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TypewriterAnimatedText(
                      'shoes',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TypewriterAnimatedText(
                      'Accessories',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TypewriterAnimatedText(
                      'Make up',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  displayFullTextOnTap: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
