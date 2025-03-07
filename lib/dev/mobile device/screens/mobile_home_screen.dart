import 'dart:math';

import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/content/drawer_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/content/shopping_car_section.dart';
import 'package:bazilbas/functions/drawer_funcion.dart';
import 'package:bazilbas/parts/mobile_body.dart';
import 'package:bazilbas/widgets/hero_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'mobile_login_screen.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen>
    with TickerProviderStateMixin {
  // double value = 0;

  @override
  void initState() {
    setState(() {});
    drawerFuncion.drawerContainer = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    drawerFuncion.drawerContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      key: scaffoldKey,
      endDrawer: const Drawer(
        //scaffoldKey.currentState?.closeEndDrawer();
        child: ShoppingCarContant(),
      ),
      body: Stack(
        children: [
          const ThemeMobileDrawer(),
          //  MobileBody(),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: drawerFuncion.valuo),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInExpo,
            builder: (_, double val, __) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 270 * val)
                  ..rotateY((pi / 6) * val),
                child: const MobileBody(),
              );
            },
          ),
          DrawerButton(
            onPressed: () {
              setState(() {
                drawerFuncion.drawerButton();
                drawerFuncion.valuo == 0
                    ? drawerFuncion.valuo = 1
                    : drawerFuncion.valuo = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      top: 26.w,
      left: drawerFuncion.isDrawer ? 200.w : 10.w,
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.backGround,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: drawerFuncion.drawerContainer,
              size: 25.w,
              color: ColorApp.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeMobileDrawer extends StatelessWidget {
  const ThemeMobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      constraints: BoxConstraints(maxWidth: 240.w),
      decoration: BoxDecoration(
        color: ColorApp.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MobilInfoUserCaed(),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
            child: Text(
              "BROWSE",
              style: TextStyle(
                color: ColorApp.backGround,
                fontSize: 15,
                fontFamily: FontApp.description,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DrawerContent(textSize: 17, iconSize: 20, shadoHeght: 40),
          )
        ],
      ),
    );
  }
}

class MobilInfoUserCaed extends StatelessWidget {
  const MobilInfoUserCaed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorApp.backGround.withOpacity(0.2),
            foregroundColor: ColorApp.backGround,
            child: SvgPicture.asset(IconApp.person),
          ),
          const SizedBox(width: 2),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userApiModel == null
                    ? "Guest"
                    : userApiModel!.userInfo!.userFullName!,
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontSize: 17,
                  fontFamily: FontApp.description,
                ),
              ),
              // const SizedBox(height: 2),
              userApiModel == null
                  ? Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MobilLoginScreen(),
                              )),
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
                        fontSize: 15,
                        fontFamily: FontApp.description,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
