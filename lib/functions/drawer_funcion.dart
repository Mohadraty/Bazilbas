import 'package:flutter/material.dart';

class DrawerFuncion {
  bool isDrawer = false;
  late AnimationController drawerContainer;
  int browseIndex = 0;
  int footerIndex = 4;
  double valuo = 0;

  void drawerButton() {
    if (drawerFuncion.isDrawer == false) {
      drawerContainer.forward();
      drawerFuncion.isDrawer = true;
    } else {
      drawerContainer.reverse();
      drawerFuncion.isDrawer = false;
    }
  }
}

DrawerFuncion drawerFuncion = DrawerFuncion();
