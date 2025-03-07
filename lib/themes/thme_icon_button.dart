import 'package:bazilbas/core/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ThemeIconButtom extends StatelessWidget {
  const ThemeIconButtom({
    super.key,
    required this.svgIcon,
    required this.onPressed,
    this.iconSize = 20,
  });
  final String svgIcon;
  final VoidCallback onPressed;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      icon: SvgPicture.asset(
        svgIcon,
        width: iconSize!.w,
        color: ColorApp.title,
      ),
    );
  }
}
