import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_states.dart';
import 'package:bazilbas/components/prodict_viow.dart';
import 'package:bazilbas/content/home_content.dart';
import 'package:bazilbas/dev/tablet%20device/screens/tablet_detlse_screen.dart';
import 'package:bazilbas/model/prodict_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return HomeContent(
            cubit: cubit,
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // crossAxisCount: crossAxisCount, // Number of columns
                // mainAxisSpacing: 15.h, // Spacing between rows
                // crossAxisSpacing: 5.w, // Spacing between columns
                // mainAxisExtent: 210.h,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productApiModel!.products!.length,
              itemBuilder: (BuildContext context, int index) {
                return ProdictView(
                    productDetails: productApiModel!.products![index]!);
              },
            ),
          );
        });
  }
}
