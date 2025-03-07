import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/dev/desktop%20device/screens/prodict_section.dart';
import 'package:bazilbas/content/shopping_car_section.dart';
import 'package:bazilbas/themes/theme_category_web_bar.dart';
import 'package:bazilbas/themes/theme_web_drawer.dart';
import 'package:flutter/material.dart';

class DeckTopBody extends StatelessWidget {
  const DeckTopBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.backGround,
      child: const Column(
        children: [
          ThemeCategoryWebBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ThemeWebDrawer(),
                ProdictSection(),
                Expanded(child: ShoppingCarContant()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
