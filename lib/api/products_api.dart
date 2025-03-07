import 'dart:convert';
import 'dart:developer';

import 'package:bazilbas/api/endpoints.dart';
import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
  Future fetchProducts() async {
    try {
      var request = await http.post(Uri.parse(Endpoints.showProducts), body: {
        'user_id': userApiModel == null ? '0' : userApiModel!.userInfo!.userId
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

  Future addToFavorite({required String productId}) async {
    try {
      var request = await http.post(Uri.parse(Endpoints.addToFavorite), body: {
        'product_id': productId,
        'user_id': userApiModel!.userInfo!.userId
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
}
