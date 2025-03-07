import 'package:bazilbas/core/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 4.w,
      height: isActive ? 12.h : 4.h,
      decoration: BoxDecoration(
        color: ColorApp.primary,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
