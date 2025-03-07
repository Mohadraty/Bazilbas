import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/src/db_app.dart';
import 'package:bazilbas/themes/theme_animated_text.dart';
import 'package:bazilbas/themes/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/auth_bloc/auth_cubit.dart';
import '../bloc/home_bloc/home_states.dart';
import '../dev/mobile device/screens/mobile_login_screen.dart';
import '../themes/theme_input_text.dart';

class ShoppingCarContant extends StatelessWidget {
  const ShoppingCarContant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is HomeFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(state.msg)));
      }
      if (state is HomeLoading) {
        EasyLoading.show(
            status: 'Processing', maskType: EasyLoadingMaskType.black);
      }

      if (state is HomeSuccess) {
        EasyLoading.dismiss();
        kIsWeb ? null : Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.green, content: Text(state.msg)));
      }
    }, builder: (context, state) {
      var cubit = HomeCubit.get(context);
      return SafeArea(
        child: Container(
          margin: EdgeInsets.all(3.w),
          width: 80.w,
          height: SizeApp.screenHeight! - 67.h,
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
            // ✅ Wrap everything inside a Column
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  IconApp.shopping,
                  color: ColorApp.title,
                ),
                title: Text(
                  "shopping cart",
                  style: TextStyle(
                    color: ColorApp.title,
                    fontFamily: FontApp.description,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${cubit.cartProducts.length} product(s) in the cart",
                  style: TextStyle(
                    color: ColorApp.primary,
                    fontFamily: FontApp.description,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w),
                child: const Divider(color: ColorApp.primary),
              ),
              Expanded(
                // ✅ Moved Expanded inside Column
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.cartProducts.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        cubit.cartProducts[index].productImages![0]!.path!,
                      ),
                    ),
                    title: Text(
                      cubit.cartProducts[index].productTitle!,
                      style: TextStyle(
                        color: ColorApp.title,
                        fontFamily: FontApp.description,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${cubit.cartProducts[index].productPrice} L.E",
                      style: TextStyle(
                        color: ColorApp.primary,
                        fontFamily: FontApp.description,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () async {
                              cubit.updateCart(
                                  productId:
                                      cubit.cartProducts[index].productId!,
                                  isIncrement: true);
                            },
                            icon: const Icon(Icons.add_circle)),
                        Text(cubit.cartProducts[index].productQuota!),
                        IconButton(
                            onPressed: () async {
                              cubit.updateCart(
                                  productId:
                                      cubit.cartProducts[index].productId!,
                                  isIncrement: false);
                            },
                            icon: const Icon(Icons.remove_circle)),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Total amount :-",
                  style: TextStyle(
                    color: ColorApp.title,
                    fontFamily: FontApp.description,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${BlocProvider.of<HomeCubit>(context).cartTotalPrice} Egyptian pound",
                  style: TextStyle(
                    color: ColorApp.primary,
                    fontFamily: FontApp.description,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: ThemeButton(
                      width: kIsWeb ? 10.w : 65.w,
                      height: 30.h,
                      onPressed: userApiModel == null
                          ? () async {
                              kIsWeb ? null : Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MobilLoginScreen(),
                                  ));
                            }
                          : () => showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: SingleChildScrollView(
                                      child: Form(
                                        key: cubit.formKey,
                                        child: Column(
                                          children: [
                                            const ThemeAnimatedText(
                                                text: 'Order now'),
                                            ThemeInputText(
                                                filter: [],
                                                hitText: "Address",
                                                hitIcon: IconApp.home,
                                                controller: cubit.addressCont),
                                            ThemeInputText(
                                                hitText: "Phone Number",
                                                hitIcon: IconApp.phone,
                                                controller: cubit.phoneCont),
                                            ThemeButton(
                                              width:
                                                  SizeApp.screenWidth! * 1 - 20,
                                              onPressed: () async {
                                                if (cubit.formKey.currentState!
                                                    .validate()) {
                                                  await cubit.createOrder();

                                                  Navigator.pop(context);
                                                }
                                              },
                                              text: "Finish Order",
                                              icon: IconApp.shopping,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                      text: userApiModel == null ? "Login" : "Buy",
                      icon: userApiModel == null
                          ? IconApp.logIn
                          : IconApp.shopping,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
