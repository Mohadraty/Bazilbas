import 'package:flutter/material.dart';

class ThemeAnimatedWidget extends StatelessWidget {
  const ThemeAnimatedWidget({
    super.key,
    required this.fistChild,
    required this.secondChild,
    required this.isAnimated,
  });
  final Widget fistChild;
  final Widget secondChild;
  final bool isAnimated;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstChild: fistChild,
      secondChild: secondChild,
      crossFadeState:
          isAnimated ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
