import 'dart:io';

import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/components/drawer_viow.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/functions/drawer_funcion.dart';
import 'package:bazilbas/model/drawer_model.dart';
import 'package:bazilbas/src/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../core/size_app.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({
    super.key,
    required this.textSize,
    required this.iconSize,
    this.shadoHeght,
  });
  final double textSize, iconSize;
  final double? shadoHeght;

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  void initState() {
    setState(() {}); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 5.h),
        Column(
          children: [
            ...List.generate(
              userApiModel == null ? 1 : 3,
              (index) => DrawerViow(
                shadoHeght: widget.shadoHeght,
                isSelected: drawerFuncion.browseIndex == index,
                onPressed: () {
                  setState(() {
                    if (drawerModel.drawerNavText[index] == 'Home') {
                      BlocProvider.of<HomeCubit>(context).showOrders = false;
                      BlocProvider.of<HomeCubit>(context).showFavorite = false;
                    }
                    if (drawerModel.drawerNavText[index] == 'Favorite') {
                      BlocProvider.of<HomeCubit>(context).showOrders = false;
                      BlocProvider.of<HomeCubit>(context).showFavorite = true;
                    }
                    if (drawerModel.drawerNavText[index] == 'Orders') {
                      BlocProvider.of<HomeCubit>(context).showOrders = true;
                    }
                    BlocProvider.of<HomeCubit>(context).refreshState();

                    drawerFuncion.browseIndex = index;

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => OrderScreen()));
                  });
                },
                iconSize: widget.iconSize,
                textsize: widget.textSize,
                text: drawerModel.drawerNavText[index],
                icon: drawerModel.drawerNavIcon[index],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: const Divider(),
        ),
        Column(
          children: [
            ...List.generate(
              3,
              (index) => DrawerViow(
                shadoHeght: widget.shadoHeght,
                isSelected: drawerFuncion.footerIndex == index,
                onPressed: () async {
                  setState(() {
                    drawerFuncion.footerIndex = index;
                  });
                  if (drawerModel.drawerFanText[index] == "LogOut") {
                    await AppShared.localStorage.setBool('active', false);
                    exit(0);
                  }
                  if (drawerModel.drawerFanText[index] == "About") {
                    showAboutDialog(
                        context: context,
                        applicationName: 'Bazilbas Store',
                        applicationIcon: Image.asset(IconApp.logoApp,
                            width: SizeApp.screenWidth! / 10),
                        children: [
                          const Text(
                              'Bazilbas is an online store that mainly focus on women-wear with leading quality and in-reach prices.')
                        ],
                        applicationLegalese:
                            'HopaQuaser\nCopyrights reserved © 2025\n');
                  }
                  if (drawerModel.drawerFanText[index] == "Share") {
                    Share.share(
                        'Download bazilbas store application or visit website for best quality women-wear');
                  }
                },
                iconSize: widget.iconSize,
                textsize: widget.textSize,
                text: drawerModel.drawerFanText[index],
                icon: drawerModel.drawerFanIcon[index],
              ),
            )
          ],
        )
      ],
    );
  }
}
