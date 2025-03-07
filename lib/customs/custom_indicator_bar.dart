import 'package:bazilbas/model/onbording_modil.dart';
import 'package:bazilbas/themes/theme_onbordind_button.dart';
import 'package:bazilbas/widgets/dot_indicator_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorBar extends StatelessWidget {
  const IndicatorBar({
    super.key,
    required this.onPressed,
    required this.pageIndex,
    required this.isFanesh,
  });
  final VoidCallback onPressed;
  final int pageIndex;
  final bool isFanesh;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              onbordingItems.onbordingItems.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: DotIndicatorWidget(isActive: index == pageIndex),
              ),
            ),
            // const Spacer(),
          ],
        ),
        SizedBox(height: 10.h),
        ThemeOnbordindButton(
          onPressed: onPressed,
          isFanesh: isFanesh,
        )
      ],
    );
  }
}
