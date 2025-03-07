import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_states.dart';
import 'package:bazilbas/components/detels_image.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/model/product_model.dart';
import 'package:bazilbas/themes/theme_button.dart';
import 'package:bazilbas/themes/thme_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/home_bloc/home_cubit.dart';
import 'mobile_login_screen.dart';

class MobileDetelsScreen extends StatelessWidget {
  const MobileDetelsScreen({super.key, required this.productDetails});

  final ProductModel productDetails;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is HomeSuccess) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.msg)));
      }
      if (state is HomeFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.msg)));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorApp.backGround,
        appBar: AppBar(
          backgroundColor: ColorApp.backGround,
          title: Text(
            productDetails.productTitle!,
            style: const TextStyle(
              color: ColorApp.title,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: ThemeIconButtom(
              onPressed: () {
                Navigator.pop(context);
              },
              svgIcon: IconApp.leftArrow,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetelsImage(images: productDetails.productImages!),
            ListTile(
              title: Text(
                productDetails.productTitle!,
              ),
              subtitle: Text(productDetails.productDescription!),
              trailing: Text(productDetails.productPrice!),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThemeButton(
              onPressed: userApiModel == null
                  ? () async {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MobilLoginScreen(),
                          ));
                    }
                  : () async {
                      EasyLoading.show(
                          status: 'Processing',
                          maskType: EasyLoadingMaskType.black);
                      await BlocProvider.of<HomeCubit>(context)
                          .addToCart(productId: productDetails.productId!);
                      EasyLoading.dismiss();
                    },
              width: SizeApp.screenWidth! * (kIsWeb ? 0.1 : 0.5) + 30,
              text: "Add to Cart",
              icon: IconApp.addShopping,
            ),
            if (userApiModel != null)
              Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorApp.primary, width: 1),
                ),
                child: ThemeIconButtom(
                    svgIcon: IconApp.favorite,
                    onPressed: () async {
                      EasyLoading.show(
                          status: 'Processing',
                          maskType: EasyLoadingMaskType.black);
                      await BlocProvider.of<HomeCubit>(context)
                          .addToFavorite(productId: productDetails.productId!);
                      EasyLoading.dismiss();
                    }),
              ),
          ],
        ),
      );
    });
  }
}
