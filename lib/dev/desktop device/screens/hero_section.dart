import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/dev/desktop%20device/screens/logo_secshen.dart';
import 'package:bazilbas/widgets/web_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      margin: EdgeInsets.all(5.w),
      width: SizeApp.screenWidth! * 1,
      height: SizeApp.screenHeight! * 1,
      decoration: BoxDecoration(
        color: ColorApp.backGround,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: const Column(
        children: [DeckTopAppBar(), LogoSecshen()],
      ),
    );
  }
}
