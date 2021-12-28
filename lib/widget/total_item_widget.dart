import 'package:flutter/material.dart';
import 'package:getx5_sample/state/cart_state.dart';

class TotalItemWidget extends StatelessWidget {
  String text = '', value = '';
  bool isSubTotal = false;
  final MyCartController controller;

  TotalItemWidget(
      {required this.text,
      required this.value,
      required this.isSubTotal,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: isSubTotal ? 20 : 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              fontSize: isSubTotal ? 20 : 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
