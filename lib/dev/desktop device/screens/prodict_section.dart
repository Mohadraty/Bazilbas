import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/components/prodict_viow.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/home_bloc/home_states.dart';

class ProdictSection extends StatelessWidget {
  const ProdictSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Container(
            width: SizeApp.screenWidth! / 2,
            height: SizeApp.screenHeight! - 67.h,
            margin: EdgeInsets.symmetric(vertical: 3.w),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: const CupertinoSearchTextField(),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 5.w),
                  child: Row(
                    children: [
                      Text(
                        "${cubit.currentCategory} products     ",
                        style: TextStyle(
                          color: ColorApp.title,
                          fontFamily: FontApp.supTitel,
                          fontWeight: FontWeight.bold,
                          fontSize: 5.w,
                        ),
                      ),
                      const Expanded(child: Divider(color: ColorApp.title))
                    ],
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: cubit.categorizer()!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProdictView(
                      productDetails: cubit.categorizer()![index]!,
                    );
                  },
                ))
              ],
            ),
          );
        });
  }
}
