import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:flutter/material.dart';

class ThemeOnbordindButton extends StatelessWidget {
  const ThemeOnbordindButton({
    super.key,
    required this.onPressed,
    required this.isFanesh,
  });
  final VoidCallback onPressed;
  final bool isFanesh;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: ColorApp.primaryHeavy,
      splashRadius: 10,
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: isFanesh ? SizeApp.screenWidth! * 1 : 60,
        height: 60,
        decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: BorderRadius.circular(isFanesh ? 20 : 100),
        ),
        child: Center(
          child: isFanesh
              ? const Text("Get started")
              : const Icon(Icons.arrow_forward_ios_outlined, size: 15),
        ),
      ),
    );
  }
}
