import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:getx5_sample/model/cart.dart';

class MyCartController extends GetxController {
  var cart = List<CartModel>.empty(growable: true).obs;

  sumCart() {
    return cart.length == 0
        ? 0
        : cart
            .map((e) => double.parse(e.price) * e.quantity)
            .reduce((previousvalue, element) => previousvalue + 1);
  }

  getQuantity() {
    return cart.length == 0
        ? 0
        : cart
            .map((e) => e.quantity)
            .reduce((previousvalue, element) => previousvalue + 1);
  }

  shippingFee() {
    return sumCart() * 0.1;
  }
}
