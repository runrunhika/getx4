import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx5_sample/state/cart_state.dart';
import 'package:getx5_sample/utils/utils.dart';
import 'package:getx5_sample/widget/cart_item_info.dart';
import 'package:getx5_sample/widget/change_quantity_widget.dart';
import 'package:getx5_sample/widget/product_image.dart';
import 'package:getx5_sample/widget/total_widget.dart';
import 'package:intl/intl.dart';

class CartDetailScreen extends StatelessWidget {
  final box = GetStorage();
  MyCartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
        centerTitle: true,
        actions: [
          InkWell(
            child: Icon(Icons.clear),
            onTap: () {
              controller.cart.clear();
              deleteCart();
            },
          )
        ],
      ),
      body: Obx(() => Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.cart.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          child: Card(
                            elevation: 8,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ProductImage(
                                      productModel: controller.cart[index],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 6,
                                      child: CartItemInfo(
                                          cartModel: controller.cart[index])),
                                  Center(
                                    child: ChangeQuantityWidget(
                                      controller: controller,
                                      index: index,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: [
                            IconSlideAction(
                              caption: 'Delete',
                              icon: Icons.delete,
                              color: Colors.red,
                              onTap: () {
                                controller.cart.removeAt(index);
                                saveDatabase(controller.cart);
                              },
                            )
                          ],
                        );
                      })),
              TotalWidget(
                controller: controller,
              )
            ],
          )),
    );
  }
}
