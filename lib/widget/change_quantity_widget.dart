import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:getx5_sample/state/cart_state.dart';
import 'package:getx5_sample/utils/utils.dart';

class ChangeQuantityWidget extends StatelessWidget {
  final MyCartController controller;
  final int index;

  const ChangeQuantityWidget({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return ElegantNumberButton(
        initialValue: controller.cart[index].quantity,
        minValue: 0,
        maxValue: 99,
        color: Colors.white,
        onChanged: (value) async {
          controller.cart[index].quantity = value.toInt();
          saveDatabase(controller.cart);
          controller.cart.refresh();
        },
        decimalPlaces: 0);
  }
}
