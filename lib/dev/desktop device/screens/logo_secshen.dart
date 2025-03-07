import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/image_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/dev/desktop%20device/screens/welcome_section.dart';
import 'package:flutter/material.dart';

class LogoSecshen extends StatelessWidget {
  const LogoSecshen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const WelcomeScshen(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              width: SizeApp.screenWidth! * 1,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(imageApp.shape, color: ColorApp.primary),
                  Image.asset(IconApp.logoApp, height: 700, width: 700)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
