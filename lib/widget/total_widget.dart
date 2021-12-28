import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:getx5_sample/state/cart_state.dart';
import 'package:intl/intl.dart';

import 'total_item_widget.dart';

class TotalWidget extends StatelessWidget {
  final MyCartController controller;

  TotalWidget({required this.controller});

  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TotalItemWidget(
              text: 'Total',
              value: formatCurrency.format(controller.sumCart()),
              controller: controller,
              isSubTotal: false,
            ),
            Divider(
              thickness: 1,
            ),
            TotalItemWidget(
              text: 'Delivery Charge',
              value: formatCurrency.format(controller.shippingFee()),
              controller: controller,
              isSubTotal: false,
            ),
            Divider(
              thickness: 1,
            ),
            TotalItemWidget(
              text: 'Sub Total',
              value: formatCurrency
                  .format(controller.shippingFee() + controller.sumCart()),
              controller: controller,
              isSubTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}
