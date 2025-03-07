import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetelsImage extends StatelessWidget {
  const DetelsImage({
    super.key,
    required this.images,
  });

  final List<ProductImage?>? images;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: SizeApp.screenWidth,
      height: SizeApp.screenHeight! / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizeApp.screenWidth! / 2,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorApp.backGround,
              image: DecorationImage(
                image: NetworkImage(
                  images![0]!.path!,
                ),
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
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (images!.length >= 2)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: SizeApp.screenHeight! * 0.5 / 3,
                    height: SizeApp.screenHeight! * 0.5 / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorApp.backGround,
                      image: DecorationImage(
                        image: NetworkImage(
                          images![1]!.path!,
                        ),
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
                  ),
                if (images!.length >= 3)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: SizeApp.screenHeight! * 0.5 / 3,
                        height: SizeApp.screenHeight! * 0.5 / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorApp.backGround,
                          image: DecorationImage(
                            image: NetworkImage(
                              images![2]!.path!,
                            ),
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
                      ),
                    ],
                  ),
                if (images!.length >= 3)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: SizeApp.screenHeight! * 0.5 / 3,
                    height: SizeApp.screenHeight! * 0.5 / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorApp.backGround,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          images![2]!.path!,
                        ),
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
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
