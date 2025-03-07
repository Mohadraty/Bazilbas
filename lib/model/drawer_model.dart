import 'package:bazilbas/core/icon_app.dart';

class DrawerModel {
  List drawerNavText = [
    "Home",
    "Favorite",
    "Orders",
  ];

  List drawerNavIcon = [
    IconApp.home,
    IconApp.favorite,
    IconApp.order,
  ];

  List drawerFanText = [
    "LogOut",
    "About",
    "Share",
  ];
  List drawerFanIcon = [
    IconApp.logOut,
    IconApp.about,
    IconApp.sharing,
  ];
  List guestFooterText = [
    "About",
    "Share",
  ];
  List guestFooterIcon = [
    IconApp.about,
    IconApp.sharing,
  ];
}

DrawerModel drawerModel = DrawerModel();
