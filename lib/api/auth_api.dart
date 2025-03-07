import 'dart:convert';
import 'dart:developer';

import 'package:bazilbas/api/endpoints.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future createUser(
      {required String email,
      required String userName,
      required String phoneNumber,
      required String password}) async {
    try {
      var request = await http.post(Uri.parse(Endpoints.createUser), body: {
        'user_email': email,
        'user_password': password,
        'user_fullName': userName,
        'user_phone': phoneNumber,
        'user_fcmToken': '1'
      });
      if (request.statusCode == 200) {
        var response = jsonDecode(request.body);
        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }

  Future loginUser({required String email, required String password}) async {
    try {
      var request = await http.post(Uri.parse(Endpoints.loginUser),
          body: {'user_email': email, 'user_password': password});
      if (request.statusCode == 200) {
        var response = jsonDecode(request.body);
        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }
}
