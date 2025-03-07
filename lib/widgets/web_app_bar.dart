import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/functions/web_function.dart';
import 'package:bazilbas/model/nav_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckTopAppBar extends StatelessWidget {
  const DeckTopAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "BazilBas",
            style: TextStyle(
              color: ColorApp.title,
              fontFamily: FontApp.supTitel,
              fontSize: 12.w,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: SizeApp.screenWidth! / 2,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ...List.generate(
                  navBarModel.navBar.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: TextButton(
                      onPressed: () {
                        int targetPage = [0, 1, 2, 3][index];
                        webFunction.pageController.animateToPage(
                          targetPage,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        navBarModel.navBar[index],
                        style: TextStyle(
                          color: ColorApp.title,
                          fontSize: 5.w,
                          fontFamily: FontApp.description,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: 90.w,
          height: 100.h,
          child: Center(
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(15),
                  width: 18,
                  child: const Icon(Icons.search_outlined),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
