import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebServicesCart extends StatelessWidget {
  const WebServicesCart({
    super.key,
    required this.image,
    required this.titel,
    required this.supTitel,
  });
  final String image, titel, supTitel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: SizeApp.screenHeight! / 1.8,
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.w, color: ColorApp.title),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 60.w,
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titel,
                style: TextStyle(
                  color: ColorApp.title,
                  fontSize: 6.w,
                  fontFamily: FontApp.description,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              supTitel,
              style: TextStyle(
                color: ColorApp.primary,
                fontSize: 4.w,
                fontFamily: FontApp.description,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
