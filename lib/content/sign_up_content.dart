import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/auth_bloc/auth_states.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';
import 'package:bazilbas/dev/mobile%20device/screens/mobile_splash_screen.dart';

import 'package:bazilbas/themes/theme_button.dart';
import 'package:bazilbas/themes/theme_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../functions/navgater_function.dart';
import '../functions/splash_function.dart';

class SignUpContent extends StatefulWidget {
  const SignUpContent({
    super.key,
  });

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ThemeInputText(
                    hitText: "User name",
                    hitIcon: IconApp.person,
                    controller: cubit.userNameCont),
                ThemeInputText(
                    hitText: "Phone numper",
                    hitIcon: IconApp.phone,
                    filter: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    controller: cubit.phoneCont),
                ThemeInputText(
                    hitText: "Email",
                    hitIcon: IconApp.email,
                    filter: [FilteringTextInputFormatter.deny(' ')],
                    controller: cubit.emailCont),
                ThemeInputText(
                    hitText: "Passwerd",
                    hitIcon: IconApp.lock,
                    filter: [FilteringTextInputFormatter.deny(' ')],
                    controller: cubit.passwordCont),
                ThemeInputText(
                    hitText: "Agen Passwerd",
                    hitIcon: IconApp.lock,
                    filter: [FilteringTextInputFormatter.deny(' ')],
                    controller: cubit.confirmPasswordCont),
                ThemeButton(
                  width: SizeApp.screenWidth! * 1 - 20,
                  onPressed: () {
                    cubit.createUser();
                  },
                  text: "Sign Up",
                  icon: IconApp.logIn,
                ),
              ],
            ),
          );
        });
  }
}
