import 'dart:convert';

import 'package:bazilbas/api/endpoints.dart';
import 'package:bazilbas/api/location_serv.dart';
import 'package:bazilbas/bloc/auth_bloc/auth_cubit.dart';
import 'package:http/http.dart' as http;

class OrdersApi {
  Future createOrder(
      {required data,
      required totalPrice,
      required phone,
      required address}) async {
    var request = await http.post(Uri.parse(Endpoints.createOrder), body: {
      'order_price': totalPrice,
      'order_clientId': userApiModel!.userInfo!.userId!,
      'order_location': await LocationService().currentLocation(),
      'order_address': address,
      'order_phone': phone,
      'order_items': jsonEncode(data),
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return 'error';
    }
  }

  Future fetchOrders() async {
    var request = await http.post(Uri.parse(Endpoints.showOrders), body: {
      'user_id': userApiModel!.userInfo!.userId!,
    });
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      return response;
    } else {
      return 'error';
    }
  }
}
