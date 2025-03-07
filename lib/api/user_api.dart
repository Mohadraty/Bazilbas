import 'dart:convert';
import 'dart:developer';

import 'package:bazilbas/api/endpoints.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future fetchUserData(String userId) async {
    try {
      var request = await http
          .post(Uri.parse(Endpoints.showUserData), body: {"user_id": userId});
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
