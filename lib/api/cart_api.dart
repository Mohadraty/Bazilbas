import 'dart:convert';
import 'dart:developer';

import 'package:bazilbas/api/endpoints.dart';
import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:http/http.dart' as http;

class CartApi {
  Future fetchCart() async {
    try {
      var request = await http.post(Uri.parse(Endpoints.showCart),
          body: {'user_id': userApiModel!.userInfo!.userId});
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

  Future addToCart({required String productId}) async {
    try {
      var request = await http.post(Uri.parse(Endpoints.addToCart), body: {
        'user_id': userApiModel!.userInfo!.userId,
        'product_id': productId
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

  Future updateCart(
      {required String productId, required bool isIncrement}) async {
    try {
      var request = await http.post(Uri.parse(Endpoints.updateCart), body: {
        'user_id': userApiModel!.userInfo!.userId,
        'product_id': productId,
        'type': isIncrement ? 'increment' : 'decrement'
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
