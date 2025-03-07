import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/responsive_%D9%90app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/dev/desktop%20device/desktop_device.dart';
import 'package:bazilbas/dev/mobile%20device/mobile_device.dart';
import 'package:bazilbas/dev/tablet%20device/teblet_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeApp().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..fetchCart()),
        BlocProvider(create: (context) => AuthCubit())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: "BazilBas",
            theme: ThemeData(
              // This is the theme of your application.
              colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primary),
              hintColor: ColorApp.primaryHeavy,
              hoverColor: ColorApp.primaryHeavy,
              primaryColor: ColorApp.primary,
              indicatorColor: ColorApp.primaryHeavy,
              dividerColor: ColorApp.title,
              useMaterial3: true,
            ),
            home: child,
          );
        },

        // root start app
        child: const ResponsiveApp(
          desktopDevice: DesktopDevice(),
          tabletDevice: TabletDevice(),
          mobileDevice: MobileDevice(),
        ),
      ),
    );
  }
}
