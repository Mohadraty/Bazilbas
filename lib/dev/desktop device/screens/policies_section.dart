import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PoliciesSection extends StatelessWidget {
  const PoliciesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      color: ColorApp.primary,
      child: Stack(
        children: [
          Positioned(
            top: 35.sp,
            right: 30.w,
            child: SvgPicture.asset(
              IconApp.logoApp,
              width: SizeApp.screenWidth! / 3.5,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy, buying and selling policies at bazilBas :-",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "Identity verification :",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- We care about protecting your personal information, so we ask that you create a strong password and activate two-step verification (2FA) for increased security.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We may ask you to verify your email or phone number when creating an account to ensure the information is correct.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              const Spacer(),
              Text(
                "Secure payment gateways:",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- We use reliable and certified payment gateways to secure payments and protect your financial data.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "We encrypt sensitive payment data and provide multiple, secure payment options to meet your needs.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              const Spacer(),
              Text(
                "Anti-fraud:",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- We implement advanced systems to detect fraudulent payments and verify the validity of credit card information.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We may delay the execution of suspicious orders until we can verify them to ensure the integrity of the transactions.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              const Spacer(),
              Text(
                "Products quality:",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- We are committed to offering high-quality products that conform to the presented specifications.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We strive to provide clear images and accurate descriptions of the products to provide a transparent shopping experience.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We operate a fair returns and exchange policy to ensure you are satisfied with your purchase.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              const Spacer(),
              Text(
                "Sale and exchange policy:",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- The order may not be canceled after receiving it, in order to ensure that our operations run efficiently and to avoid any delays in the delivery of other orders.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- There is only one exception to this, which is if the product is damaged when you receive it. In this case, please contact our customer service team immediately to file a complaint and take necessary action.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- The order may not be exchanged after two days from the date of receipt, in order to ensure that the quality of the products is maintained and that they are not subject to damage or use.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We ask our valued customers to ensure that they choose the appropriate products before completing the purchase process.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              const Spacer(),
              Text(
                "Additional Tips:",
                style: TextStyle(
                  color: ColorApp.title,
                  fontFamily: FontApp.titel,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- Users are advised to review our Privacy Policy to understand how we collect, use and protect their personal information.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We recommend that users contact our customer service team if they have any inquiries or complaints.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              Text(
                "- We limit the application's liability in cases of fraud or damage, and emphasize that the user is responsible for the accuracy of the data he provides.",
                style: TextStyle(
                  color: ColorApp.backGround,
                  fontFamily: FontApp.description,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
