import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/content/home_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/functions/catagory_bar_funcion.dart';
import 'package:bazilbas/model/category_model.dart';
import 'package:bazilbas/themes/thme_icon_button.dart';
import 'package:bazilbas/widgets/category_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeCategoryWebBar extends StatefulWidget {
  const ThemeCategoryWebBar({
    super.key,
  });

  @override
  State<ThemeCategoryWebBar> createState() => _ThemeCategoryWebBarState();
}

class _ThemeCategoryWebBarState extends State<ThemeCategoryWebBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth,
      height: 50.h,
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: ColorApp.backGround,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorApp.title.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Image.asset(
              IconApp.logoApp,
              color: ColorApp.title,
              width: 7.w,
            ),
          ),
          Text(
            "BazilBas",
            style: TextStyle(
              color: ColorApp.title,
              fontFamily: FontApp.supTitel,
              fontSize: 7.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: SizeApp.screenWidth! / 2,
              height: 100.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      categoryModel.categoryItem.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: CategoryBar(
                          onPressed: () {
                            catagoryBarFuncion.currenIndex = index;
                            catagoryBarFuncion.textProdict =
                                categoryModel.categoryItem[index];
                            BlocProvider.of<HomeCubit>(context).switchCategory(
                                categoryModel.categoryItem[index]);
                            setState(() {
                              catagoryBarFuncion.currenIndex = index;
                              HapticFeedback.lightImpact();
                            });
                          },
                          index: index,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ThemeIconButtom(
              onPressed: () {},
              svgIcon: IconApp.person,
              iconSize: 7,
            ),
          )
        ],
      ),
    );
  }
}
