import 'package:bazilbas/content/drawer_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/auth_bloc/auth_cubit.dart';

class ThemeWebDrawer extends StatelessWidget {
  const ThemeWebDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth! / 4,
      height: SizeApp.screenHeight! / 2 + 120,
      padding: EdgeInsets.all(2.w),
      margin: EdgeInsets.all(5.w),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 7.w,
                ),
                Text(
                  textAlign: TextAlign.center,
                  userApiModel == null
                      ? "Guest"
                      : userApiModel!.userInfo!.userFullName!,
                  style: TextStyle(
                    color: ColorApp.title,
                    fontFamily: FontApp.description,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                userApiModel == null
                    ? Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: Ink(
                              child: Text(
                                userApiModel == null
                                    ? "Login or Register"
                                    : userApiModel!.userInfo!.userEmail!,
                                style: TextStyle(
                                  color: ColorApp.backGround.withOpacity(0.7),
                                  fontSize: 15,
                                  fontFamily: FontApp.description,
                                ),
                              ),
                            )),
                      )
                    : Text(
                        userApiModel!.userInfo!.userEmail!,
                        style: TextStyle(
                          color: ColorApp.backGround.withOpacity(0.7),
                          fontSize: 14,
                          fontFamily: FontApp.description,
                        ),
                      )
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: SizeApp.screenWidth! * 0.07),
              const Expanded(
                child: DrawerContent(
                  iconSize: 5,
                  textSize: 5,
                  shadoHeght: 37,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
