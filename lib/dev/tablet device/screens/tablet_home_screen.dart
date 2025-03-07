import 'package:bazilbas/content/drawer_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/content/shopping_car_section.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/dev/mobile%20device/screens/mobile_home_screen.dart';
import 'package:bazilbas/parts/taplet_body.dart';
import 'package:bazilbas/widgets/hero_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorApp.backGround,
      appBar: HeroAppBar(context),
      drawer: Drawer(
        child: Container(
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
                child:
                    DrawerContent(textSize: 17, iconSize: 20, shadoHeght: 40),
              )
            ],
          ),
        ),
      ),
      endDrawer: const Drawer(
        child: Expanded(child: ShoppingCarContant()),
      ),
      body: const TabletBody(),
    );
  }
}
