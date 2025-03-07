import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/auth_bloc/auth_states.dart';
import 'package:bazilbas/content/sign_in_content.dart';
import 'package:bazilbas/content/sign_up_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/dev/desktop%20device/screens/desktop_splash.dart';
import 'package:bazilbas/functions/login_funcion.dart';
import 'package:bazilbas/themes/theme_animated_widget.dart';
import 'package:bazilbas/themes/thme_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../functions/navgater_function.dart';
import 'mobile_splash_screen.dart';

class MobilLoginScreen extends StatefulWidget {
  const MobilLoginScreen({super.key});

  @override
  State<MobilLoginScreen> createState() => _MobilLoginScreenState();
}

class _MobilLoginScreenState extends State<MobilLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is AuthFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.msg)));
      }
      if (state is AuthSuccess) {
        Navigator.pop(context);
        Navigator.canPop(context) ? Navigator.pop(context) : null;
        navgaterFunction.pushReplacementNav(context,
            kIsWeb ? const DesktopSplash() : const MobileSplashScreen());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.msg)));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorApp.backGround,
        appBar: AppBar(
          backgroundColor: ColorApp.backGround,
          title: ThemeAnimatedWidget(
            fistChild: Text(
              "Log In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorApp.primary,
                fontSize: SizeApp.smallTextSize,
              ),
            ),
            secondChild: Text(
              "Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorApp.primary,
                fontSize: SizeApp.smallTextSize,
              ),
            ),
            isAnimated: loginFuncion.isAccont,
          ),
          leading: ThemeIconButtom(
            svgIcon: IconApp.leftArrow,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  IconApp.logoApp,
                  width: 50.w,
                  color: ColorApp.title,
                ),
                Title(
                  color: ColorApp.title,
                  child: Text(
                    "BazilBas",
                    style: TextStyle(
                      fontFamily: FontApp.titel,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ThemeAnimatedWidget(
                  fistChild: const SignInContent(),
                  secondChild: const SignUpContent(),
                  isAnimated: loginFuncion.isAccont,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      loginFuncion.isAccont = !loginFuncion.isAccont;
                    });
                  },
                  child: ThemeAnimatedWidget(
                    fistChild: Text(
                      "I don't have an account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorApp.primary,
                        fontSize: SizeApp.smallTextSize,
                      ),
                    ),
                    secondChild: Text(
                      "Already have an account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorApp.primary,
                        fontSize: SizeApp.smallTextSize,
                      ),
                    ),
                    isAnimated: loginFuncion.isAccont,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
