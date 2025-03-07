import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ThemeInputText extends StatelessWidget {
  final String hitText;
  final String hitIcon;
  final TextEditingController controller;
  const ThemeInputText(
      {super.key,
      required this.hitText,
      required this.hitIcon,
      this.filter,
      required this.controller});
  final List<FilteringTextInputFormatter>? filter;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 40.h,
      decoration: BoxDecoration(
        // border: border_check_last_name,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        // boxShadow: [
        //   BoxShadow(
        //     offset: const Offset(0.0, 10.0),
        //     blurRadius: 50.0,
        //     color: Colors.black.withOpacity(0.23),
        //     // color: Colors.black.withOpacity(0.23),
        //   ),
        // ],
        border: Border.all(width: 2, color: ColorApp.primary),
      ),
      child: TextFormField(
        inputFormatters: hitText == 'Phone Number'
            ? [FilteringTextInputFormatter.digitsOnly]
            : filter,
        validator: (value) {
          if (value!.isEmpty) {
            return '*Empty';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: hitText,
          hintStyle: TextStyle(
            // color: Textcolor,
            fontFamily: FontApp.description,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorApp.primary,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              hitIcon,
              width: 22,
              color: ColorApp.description,
            ),
          ),
        ),
      ),
    );
  }
}
