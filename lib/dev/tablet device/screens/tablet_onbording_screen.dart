import 'package:bazilbas/content/onbording_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/customs/custom_indicator_bar.dart';
import 'package:bazilbas/dev/tablet%20device/screens/tablet_home_screen.dart';
import 'package:bazilbas/functions/onbording_function.dart';
import 'package:bazilbas/model/onbording_modil.dart';
import 'package:bazilbas/themes/theme_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabletOnbordingScreen extends StatefulWidget {
  const TabletOnbordingScreen({super.key});

  @override
  State<TabletOnbordingScreen> createState() => _TabletOnbordingScreenState();
}

class _TabletOnbordingScreenState extends State<TabletOnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "BazilBas",
          style: TextStyle(
            fontSize: 25.0.w,
            color: ColorApp.description,
            fontWeight: FontWeight.bold,
            fontFamily: FontApp.supTitel,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            IconApp.logoApp,
            width: 20.w,
            color: ColorApp.primaryHeavy,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // const DecorationBar(viewbackButton: false),

            // Onbording viow
            OnbordingContant(
              pageController: onbordingFunction.pageController,
              onPageChanged: (value) {
                setState(() {
                  onbordingFunction.isEnd =
                      onbordingItems.onbordingItems.length - 1 == value;
                  onbordingFunction.pageIndex = value;
                });
              },
            ),
            // Skip Button
            Positioned(
              top: 40.h,
              right: 40.w,
              child: ThemeAnimatedWidget(
                isAnimated: onbordingFunction.isEnd,
                fistChild: const SizedBox(),
                secondChild: TextButton(
                  onPressed: () => onbordingFunction.onbordingSkip(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("skip"),
                  ),
                ),
              ),
            ),
            // Get started Button
            Positioned(
              bottom: 40.h,
              left: 40.w,
              right: 40.w,
              child: IndicatorBar(
                pageIndex: onbordingFunction.pageIndex,
                isFanesh: onbordingFunction.isEnd,
                onPressed: () => onbordingFunction.isEnd
                    ? onbordingFunction.goToHome(
                        context,
                        const TabletHomeScreen(),
                      )
                    : onbordingFunction.onbordingNext(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
