import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/content/splash_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/dev/mobile%20device/screens/mobile_home_screen.dart';
import 'package:bazilbas/dev/mobile%20device/screens/mobile_onbording_screen.dart';
import 'package:bazilbas/functions/splash_function.dart';
import 'package:bazilbas/src/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileSplashScreen extends StatefulWidget {
  const MobileSplashScreen({super.key});

  @override
  State<MobileSplashScreen> createState() => _MobileSplashScreenState();
}

class _MobileSplashScreenState extends State<MobileSplashScreen> {
  @override
  void initState() {
    onStart();
    super.initState();
  }

  onStart() async {
    if (AppShared.localStorage.getBool('active')!) {
      await BlocProvider.of<AuthCubit>(context)
          .fetchUserData(AppShared.localStorage.getString('user_id'));
      await BlocProvider.of<HomeCubit>(context).fetchCart();
      await BlocProvider.of<HomeCubit>(context).fetchOrders();
    }
    await BlocProvider.of<HomeCubit>(context).fetchProducts();

    AppShared.localStorage.getBool('onboarded') == true
        ? splashFunction.skipSplash(context, const MobileHomeScreen())
        : splashFunction.skipSplash(context, const MobileOnbordingScreen());
  }

  @override
  void setState(VoidCallback fn) {
    splashFunction.animatedLogo();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.backGround,
      body: SplashContent(),
    );
  }
}
