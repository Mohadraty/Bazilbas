import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/dev/mobile%20device/screens/mobile_detels_screen.dart';
import 'package:bazilbas/functions/navgater_function.dart';
import 'package:bazilbas/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdictView extends StatelessWidget {
  const ProdictView({
    super.key,
    required this.productDetails,
  });

  final ProductModel productDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.backGround,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                productDetails.productImages![0]!.path!),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            navgaterFunction.navgaterFunction(
                context, MobileDetelsScreen(productDetails: productDetails));
          },
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: SizeApp.screenWidth,
                height: 30.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: ColorApp.backGround,
                ),
                child: Center(
                  child: Text(
                    productDetails.productTitle!,
                    style: TextStyle(
                      fontFamily: FontApp.description,
                      fontSize: SizeApp.smallTextSize,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.title,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
