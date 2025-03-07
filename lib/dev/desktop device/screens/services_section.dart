import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/dev/desktop%20device/screens/footer_section.dart';
import 'package:bazilbas/model/onbording_modil.dart';
import 'package:bazilbas/widgets/web_services_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.backGround,
      padding: EdgeInsets.all(10.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services and benefits provided by BazilBas :-",
              style: TextStyle(
                color: ColorApp.title,
                fontFamily: FontApp.description,
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  onbordingItems.onbordingItems.length,
                  (index) => WebServicesCart(
                    image: onbordingItems.onbordingItems[index].image,
                    titel: onbordingItems.onbordingItems[index].titel,
                    supTitel: onbordingItems.onbordingItems[index].description,
                  ),
                ),
              ],
            ),
            const FooterSection()
          ],
        ),
      ),
    );
  }
}
