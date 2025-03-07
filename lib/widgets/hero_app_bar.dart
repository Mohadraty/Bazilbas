import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
AppBar HeroAppBar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorApp.backGround, centerTitle: true,
    // leading: SizedBox(),
    title: Text(
      "BazilBas",
      style: TextStyle(
        fontSize: 25.0.w,
        color: ColorApp.title,
        fontWeight: FontWeight.bold,
        fontFamily: FontApp.supTitel,
      ),
    ),
    actions: [
      // IconButton(
      //   onPressed: () {},
      //   icon: SvgPicture.asset(
      //     IconApp.person,
      //     width: 22.w,
      //     color: ColorApp.primary,
      //   ),
      // ),
      IconButton(
        onPressed: () {
          scaffoldKey.currentState?.openEndDrawer();
        },
        icon: Badge(
          isLabelVisible:
              BlocProvider.of<HomeCubit>(context).cartProducts.isNotEmpty,
          label: Text(BlocProvider.of<HomeCubit>(context)
              .cartProducts
              .length
              .toString()),
          child: SvgPicture.asset(
            IconApp.shopping,
            width: 22.w,
            color: ColorApp.primary,
          ),
        ),
      ),
      SizedBox(width: 5.w),
    ],
  );
}
