import 'package:bazilbas/core/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterIcons extends StatelessWidget {
  const FooterIcons({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final String icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.w),
      margin: EdgeInsets.all(1.w),
      decoration: const BoxDecoration(
        color: ColorApp.backGround,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(icon, width: 7.w, color: ColorApp.title),
      ),
    );
  }
}
