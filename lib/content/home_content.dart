import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/functions/catagory_bar_funcion.dart';
import 'package:bazilbas/model/category_model.dart';
import 'package:bazilbas/widgets/category_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key, required this.body, required this.cubit});

  final Widget body;
  final HomeCubit cubit;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.cubit.showOrders)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  autofocus: false,
                  controller: widget.cubit.keyWord,
                  onChanged: (s) => widget.cubit.categorizer(),
                ),
              ),
              Container(
                // height: 65.h,
                margin: const EdgeInsets.all(5),
                width: SizeApp.screenWidth! * 1,
                padding: const EdgeInsets.all(2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        categoryModel.categoryItem.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: CategoryBar(
                            iconSize: 25,
                            index: index,
                            onPressed: () {
                              catagoryBarFuncion.currenIndex = index;
                              catagoryBarFuncion.textProdict =
                                  categoryModel.categoryItem[index];
                              widget.cubit.switchCategory(
                                  categoryModel.categoryItem[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                !widget.cubit.showOrders
                    ? "${catagoryBarFuncion.textProdict} product     "
                    : "All Orders",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.supTitel,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.w,
                ),
              ),
              const Expanded(child: Divider())
            ],
          ),
        ),
        Expanded(
          child: widget.body,
        ),
      ],
    );
  }
}
