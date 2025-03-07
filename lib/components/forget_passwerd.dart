

import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:flutter/material.dart';

class ForgetPasswerd extends StatelessWidget {
  const ForgetPasswerd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget Passwerd",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorApp.primary,
              fontSize: SizeApp.smallTextSize,
            ),
          ),
        ),
      ],
    );
  }
}
