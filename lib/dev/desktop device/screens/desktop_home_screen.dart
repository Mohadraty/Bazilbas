import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/dev/desktop%20device/screens/hero_section.dart';
import 'package:bazilbas/dev/desktop%20device/screens/policies_section.dart';
import 'package:bazilbas/dev/desktop%20device/screens/services_section.dart';
import 'package:bazilbas/functions/web_function.dart';
import 'package:bazilbas/parts/decktop_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backGround,
      body: PageView(
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            webFunction.currentPage = value;
          });
        },
        controller: webFunction.pageController,
        children: const [
          HeroSection(),
          DeckTopBody(),
          PoliciesSection(),
          ServicesSection(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
            duration: const Duration(milliseconds: 500),
            width: webFunction.currentPage > 0 ? 8.w : 0,
            height: webFunction.currentPage > 0 ? 8.w : 0,
            decoration: BoxDecoration(
              color: ColorApp.backGround,
              border: Border.all(color: ColorApp.primary, width: 1.w),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                  icon: SvgPicture.asset(
                    IconApp.upArrow,
                    color: ColorApp.primary,
                  ),
                  onPressed: () {
                    webFunction.pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
