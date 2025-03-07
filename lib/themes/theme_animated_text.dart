import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeAnimatedText extends StatelessWidget {
  const ThemeAnimatedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TypewriterAnimatedText(
            speed: const Duration(milliseconds: 300),
            text,
            textStyle: TextStyle(
              fontSize: 40.0.w,
              color: ColorApp.description,
              fontWeight: FontWeight.bold,
              fontFamily: FontApp.supTitel,
            ),
          ),
        ],
        isRepeatingAnimation: true,
        // repeatForever: true,
      ),
    );
  }
}
