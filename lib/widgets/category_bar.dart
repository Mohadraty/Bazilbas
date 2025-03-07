import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/functions/catagory_bar_funcion.dart';
import 'package:bazilbas/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar(
      {super.key,
      required this.index,
      required this.onPressed,
      this.iconSize = 5});

  final int index;
  final VoidCallback onPressed;
  final int? iconSize;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      // width: 4.w,
      height: 30.h,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: index == catagoryBarFuncion.currenIndex
            ? ColorApp.backGround
            : ColorApp.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorApp.primary, width: 2),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        icon: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: SvgPicture.asset(
                  categoryModel.categoryIcon[index],
                  width: iconSize!.w,
                  color: index == catagoryBarFuncion.currenIndex
                      ? ColorApp.title
                      : ColorApp.backGround,
                ),
              ),
              Text(
                index == catagoryBarFuncion.currenIndex
                    ? categoryModel.categoryItem[index]
                    : "",
                style: TextStyle(
                    fontFamily: FontApp.description,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
