import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/functions/drawer_funcion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerViow extends StatelessWidget {
  const DrawerViow({
    super.key,
    required this.text,
    required this.icon,
    required this.iconSize,
    required this.textsize,
    required this.onPressed,
    required this.isSelected,
    this.shadoHeght = 45,
  });

  final String text;
  final String icon;
  final double iconSize, textsize;
  final double? shadoHeght;
  final VoidCallback onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: shadoHeght!.h,
          width: isSelected ? 200 - 16 : 0,
          decoration: BoxDecoration(
            color: ColorApp.primaryHeavy.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        CupertinoButton(
          // padding: EdgeInsets.all(5.w),
          onPressed: onPressed,
          pressedOpacity: 1,
          child: Row(
            children: [
              Opacity(
                opacity: 0.6,
                child: SvgPicture.asset(
                  icon,
                  width: iconSize.w,
                  color: ColorApp.backGround,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                text,
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontSize: textsize.w,
                  fontFamily: FontApp.description,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
