import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.width,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.height = 40,
  });

  final double width;
  final double? height;
  final VoidCallback onPressed;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height!.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorApp.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontApp.description,
                  fontSize: 15.h,
                ),
              ),
              SvgPicture.asset(
                icon,
                color: ColorApp.backGround,
                width: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
