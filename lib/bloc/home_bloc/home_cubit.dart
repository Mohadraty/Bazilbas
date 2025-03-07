import 'package:bazilbas/api/cart_api.dart';
import 'package:bazilbas/api/orders_api.dart';
import 'package:bazilbas/api/products_api.dart';
import 'package:bazilbas/model/order_model.dart';
import 'package:bazilbas/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<ProductModel> cartProducts = [];
  double cartTotalPrice = 0;
  String currentCategory = 'All';
  bool showFavorite = false;
  bool showOrders = false;
  TextEditingController keyWord = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> fetchProducts() async {
    await ProductsApi().fetchProducts().then((r) {
      if (r == null || r == 'error') {
        {
          emit(HomeFailure('Something went Wrong'));
        }
      } else {
        productApiModel = ProductApiModel.fromJson(r);
        emit(HomeSuccess('Fetching Products'));
      }
    });
  }

  Future<void> fetchOrders() async {
    await OrdersApi().fetchOrders().then((r) {
      if (r == null || r == 'error') {
        {
          emit(HomeFailure('Something went Wrong'));
        }
      } else {
        ordersModel = OrdersModel.fromJson(r);
        emit(HomeSuccess('Fetching Products'));
      }
    });
  }

  Future<void> fetchCart() async {
    cartProducts.clear();
    cartTotalPrice = 0;
    await CartApi().fetchCart().then((r) {
      if (r == null || r == 'error') {
        {
          emit(HomeFailure('Something went Wrong'));
        }
      } else {
        cartApiModel = ProductApiModel.fromJson(r);
        for (var i = 0; i < cartApiModel!.products!.length; i++) {
          cartTotalPrice += double.parse(
                  cartApiModel!.products![i]!.productPrice.toString()) *
              int.parse(cartApiModel!.products![i]!.productQuota.toString());
          cartProducts.add(cartApiModel!.products![i]!);
        }
        emit(HomeInitial());
      }
    });
  }

  Future<void> addToCart({required String productId}) async {
    await CartApi().addToCart(productId: productId).then((r) async {
      if (r == null || r == 'error') {
        {
          emit(HomeFailure('Check Internet'));
        }
      } else if (r['success'] == true) {
        await fetchCart();
        emit(HomeSuccess(r['message']));
      } else {
        emit(HomeFailure(r['message']));
      }
    });
  }

  Future<void> addToFavorite({required String productId}) async {
    await ProductsApi().addToFavorite(productId: productId).then((r) async {
      if (r == null || r == 'error') {
        {
          emit(HomeFailure('Check Internet'));
        }
      } else if (r['success'] == true) {
        await fetchProducts();
        emit(HomeSuccess(r['message']));
      } else {
        emit(HomeFailure(r['message']));
      }
    });
  }

  Future<void> updateCart(
      {required String productId, required bool isIncrement}) async {
    EasyLoading.show(status: 'Processing', maskType: EasyLoadingMaskType.black);
    await CartApi()
        .updateCart(productId: productId, isIncrement: isIncrement)
        .then((r) async {
      if (r == null || r == 'error') {
        {
          emit(HomeFailure('Check Internet'));
        }
      } else if (r['success'] == true) {
        await fetchCart();
        emit(HomeInitial());
      } else {
        emit(HomeFailure(r['message']));
      }
    });
    EasyLoading.dismiss();
  }

  switchCategory(String category) {
    currentCategory = category;
    categorizer();
    emit(HomeInitial());
  }

  List<ProductModel?>? categorizer() {
    List<ProductModel> categorizedList = [];
    final isSearchActive = keyWord.text.isNotEmpty;
    final isAllCategory = currentCategory == 'All';

    bool matchesCategory(ProductModel product) {
      return isAllCategory || product.productCategory == currentCategory;
    }

    bool matchesSearch(ProductModel product) {
      return product.productTitle!
          .toLowerCase()
          .contains(keyWord.text.toLowerCase());
    }

    bool shouldAddProduct(ProductModel product) {
      if (showFavorite) {
        return product.isBookMarked! && matchesCategory(product);
      } else {
        return matchesCategory(product);
      }
    }

    for (var product in productApiModel!.products!) {
      if (product == null) continue; // Null safety check

      if (isSearchActive) {
        if (matchesSearch(product) &&
            !categorizedList.contains(product) &&
            shouldAddProduct(product)) {
          categorizedList.add(product);
        }
      } else if (shouldAddProduct(product)) {
        categorizedList.add(product);
      }
    }

    // Emit state only once after processing all products
    emit(HomeInitial());

    return categorizedList;
  }

  createOrder() async {
    if (cartProducts.isNotEmpty) {
      emit(HomeLoading());
      OrdersApi()
          .createOrder(
        address: addressCont.text.trim(),
        phone: phoneCont.text,
        data: cartProducts.map((e) => e.toJson()).toList(),
        totalPrice: cartTotalPrice.toString(),
      )
          .then((r) async {
        if (r == null || r == 'error') {
          emit(HomeFailure('Check Connection'));
        } else if (r['success'] == true) {
          cartProducts.clear();
          cartTotalPrice = 0;
          fetchOrders();
          emit(HomeSuccess(r['message']));
        } else if (r['success'] == false) {
          emit(HomeFailure(r['message']));
        }
      });
    } else {
      emit(HomeFailure('Empty Cart'));
    }
  }

  refreshState() {
    emit(HomeInitial());
  }
}

OrdersModel? ordersModel;
ProductApiModel? productApiModel;
ProductApiModel? cartApiModel;
