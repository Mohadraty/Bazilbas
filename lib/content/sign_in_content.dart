import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:bazilbas/bloc/auth_bloc/auth_states.dart';
import 'package:bazilbas/components/divider_with.dart';
import 'package:bazilbas/components/forget_passwerd.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/core/font_app.dart';
import 'package:bazilbas/core/icon_app.dart';
import 'package:bazilbas/core/size_app.dart';

import 'package:bazilbas/themes/theme_button.dart';
import 'package:bazilbas/themes/theme_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ThemeInputText(
                    hitText: "Email",
                    filter: [FilteringTextInputFormatter.deny(' ')],
                    hitIcon: IconApp.email,
                    controller: cubit.emailCont),
                ThemeInputText(
                    filter: [FilteringTextInputFormatter.deny(' ')],
                    hitText: "Passwerd",
                    hitIcon: IconApp.lock,
                    controller: cubit.passwordCont),
                const SizedBox(height: 10),
                ThemeButton(
                  width: SizeApp.screenWidth! * 1 - 20,
                  onPressed: () {
                    if (cubit.loginKey.currentState!.validate()) {
                      cubit.loginUser();
                    }
                  },
                  text: "Sign In",
                  icon: IconApp.logIn,
                ),
                const ForgetPasswerd(),
                SizedBox(height: 5.w),
                const DividerWith(
                  text: "Register using",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      2,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 50.h),
                        child: Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            // border: border_check_last_name,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0.0, 10.0),
                                blurRadius: 50.0,
                                color: Colors.black.withOpacity(0.23),
                                // color: Colors.black.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: IconButton(
                            splashRadius: 10,
                            onPressed: index == 0
                                ? () {
                                    print("faceBook");
                                  }
                                : () {
                                    print("google");
                                  },
                            icon: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  index == 0
                                      ? IconApp.faceBook
                                      : IconApp.instagram,
                                  color: ColorApp.primary,
                                  width: 30.w,
                                ),
                                Text(
                                  index == 0 ? "FaceBook" : "Google",
                                  style: TextStyle(
                                    color: ColorApp.primary,
                                    fontFamily: FontApp.description,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
