import 'dart:convert';

import 'package:bazilbas/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  static late SharedPreferences localStorage;
  static Future<void> init() async {
    localStorage = await SharedPreferences.getInstance();
    localStorage.getBool('active') == null
        ? localStorage.setBool('active', false)
        : null;
    localStorage.getString('user_id') == null
        ? localStorage.setString('user_id', '')
        : null;
    localStorage.getBool('onboarded') == null
        ? localStorage.setBool('onboarded', false)
        : null;
    localStorage.getStringList('cart') == null
        ? localStorage.setStringList('cart', [])
        : null;
  }

  addToCart(ProductModel product) async {
    List<String> cartList = localStorage.getStringList('cart')!;
    cartList.add(jsonEncode(product.toJson()));
    localStorage.setStringList('cart', cartList);
  }

  incrementProduct(ProductModel cartProduct) async {
    List<String> cartList = localStorage.getStringList('cart')!;
    int productIndex = cartList.indexWhere((e) =>
        ProductModel.fromJson(jsonDecode(e)).productId ==
        cartProduct.productId);
    cartProduct.productQuota =
        (int.parse(cartProduct.productQuota!) + 1).toString();
    cartList[productIndex] = jsonEncode(cartProduct.toJson());
    localStorage.setStringList('cart', cartList);
  }

  decrement(ProductModel cartProduct) async {
    List<String> cartList = localStorage.getStringList('cart')!;
    int productIndex = cartList.indexWhere((e) =>
        ProductModel.fromJson(jsonDecode(e)).productId ==
        cartProduct.productId);
    cartProduct.productQuota =
        (int.parse(cartProduct.productQuota!) - 1).toString();
    cartList[productIndex] = jsonEncode(cartProduct.toJson());
    localStorage.setStringList('cart', cartList);
  }
}
