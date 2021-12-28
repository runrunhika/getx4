import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx5_sample/model/cart.dart';
import 'package:getx5_sample/model/product.dart';

const MY_CART_KEY = 'Cart';

Future<List<ProductModel>> readJsonDatabase() async {
  final rawData = await rootBundle.loadString("assets/data.json");
  final list = json.decode(rawData) as List<dynamic>;
  return list.map((e) => ProductModel.fromJson(e)).toList();
}

bool isExistsInCart(RxList<CartModel> cart, CartModel cartItem) {
  return cart.length == 0
      ? false
      : cart.any((e) => e.id == cartItem.id)
          ? true
          : false;
}

void saveDatabase(RxList<CartModel> cart) {
  var box = GetStorage();
  box.write(MY_CART_KEY, jsonEncode(cart));
}

void deleteCart() {
  var box = GetStorage();
  box.remove(MY_CART_KEY);
}
