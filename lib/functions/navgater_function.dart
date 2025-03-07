import 'package:flutter/material.dart';

class NavgaterFunction {
  navgaterFunction(context, screen) => Navigator.push(
        context,
        PageRouteBuilder<Offset>(
          pageBuilder: (context, animation, secondaryAnimation) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin * 2, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: screen);
          },
        ),
      );
  pushReplacementNav(context, screen) => Navigator.pushReplacement(
        context,
        PageRouteBuilder<Offset>(
          pageBuilder: (context, animation, secondaryAnimation) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin * 2, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: screen);
          },
        ),
      );
}

NavgaterFunction navgaterFunction = NavgaterFunction();
