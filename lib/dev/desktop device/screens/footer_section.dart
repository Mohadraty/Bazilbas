import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/functions/web_function.dart';
import 'package:bazilbas/widgets/footer_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.screenWidth,
      height: 265.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorApp.title,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact us in case of problem via:-",
            style: TextStyle(
              color: ColorApp.backGround,
              fontFamily: FontApp.description,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FooterIcons(
                    onPressed: webFunction.contactFaceBook,
                    icon: IconApp.faceBook,
                  ),
                  FooterIcons(
                    onPressed: webFunction.contactInstagram,
                    icon: IconApp.instagram,
                  ),
                  FooterIcons(
                    onPressed: webFunction.contactPhone,
                    icon: IconApp.whatsapp,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              const Text("Copyright reserved by"),
              SizedBox(
                width: 100.w,
                height: 50.h,
                child: IconButton(
                  onPressed: webFunction.contactHopaQuaswer,
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SvgPicture.asset(
                          "assets/icons/quasar-logo.svg",
                          width: 5.w,
                        ),
                      ),
                      Text(
                        "Hopa Quaser",
                        style: TextStyle(
                          fontSize: 5.w,
                          fontFamily: FontApp.description,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.backGround,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
