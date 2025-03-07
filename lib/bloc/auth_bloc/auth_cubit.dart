import 'package:bazilbas/api/auth_api.dart';
import 'package:bazilbas/api/user_api.dart';
import 'package:bazilbas/model/user_model.dart';
import 'package:bazilbas/src/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();
  final TextEditingController userNameCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController confirmPasswordCont = TextEditingController();
  Future<void> createUser() async {
    EasyLoading.show(status: 'Checking data.', dismissOnTap: false);
    await AuthApi()
        .createUser(
            email: emailCont.text.trim(),
            password: passwordCont.text.trim(),
            phoneNumber: phoneCont.text.trim(),
            userName: userNameCont.text.trim())
        .then((res) async {
      if (res == null || res == 'error') {
        emit(AuthFailure('Check internet connection.'));
      } else if (res['success'] == false) {
        emit(AuthFailure(res['message']));
      } else {
        await fetchUserData(res['user_id']);
        emit(AuthSuccess(res['message']));
      }
      EasyLoading.dismiss();
    });
  }

  Future<void> loginUser() async {
    EasyLoading.show(
        status: 'Checking data.',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
    await AuthApi()
        .loginUser(
            email: emailCont.text.trim(), password: passwordCont.text.trim())
        .then((res) async {
      if (res == null || res == 'error') {
        emit(AuthFailure('Check internet connection'));
      } else if (res['success'] == false) {
        emit(AuthFailure(res['message']));
      } else {
        await fetchUserData(res['user_id']);
        emit(AuthSuccess(res['message']));
      }
      EasyLoading.dismiss();
    });
  }

  fetchUserData(userId) async {
    await UserApi().fetchUserData(userId).then((data) {
      userApiModel = UserApiModel.fromJson(data);
      AppShared.localStorage
          .setString('user_id', userApiModel!.userInfo!.userId!);
    });
    AppShared.localStorage.setBool('active', true);
    emit(AuthInitial());
  }
}

UserApiModel? userApiModel;
