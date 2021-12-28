import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx5_sample/model/cart.dart';
import 'package:getx5_sample/model/product.dart';
import 'package:getx5_sample/state/cart_state.dart';
import 'package:getx5_sample/utils/utils.dart';

class ProductInfo extends StatelessWidget {
  ProductModel? productModel;
  ProductInfo({this.productModel});

  final controller = Get.put(MyCartController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            '${productModel!.name}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '￥${productModel!.price}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          InkWell(
            child: Icon(Icons.add_shopping_cart_outlined),
            onTap: () async {
              var cartItem = CartModel(
                  id: productModel!.id,
                  name: productModel!.name,
                  oldPricce: productModel!.oldPrice,
                  price: productModel!.price,
                  imageUrl: productModel!.imageUrl,
                  category: productModel!.category,
                  quantity: 1);

              if (isExistsInCart(controller.cart, cartItem)) {
                // var indexUpdate =
                //     controller.cart.indexWhere((e) => e.id == productModel!.id);
                var productUpdate = controller.cart
                    .firstWhere((element) => element.id == productModel!.id);
                productUpdate.quantity += 1;
                // controller.cart.insert(indexUpdate, productUpdate);
              } else {
                controller.cart.add(cartItem);
                var jsonDBEncoded = jsonEncode(controller.cart);
                await box.write(MY_CART_KEY, jsonDBEncoded);
                controller.cart.refresh();
              }
            },
          )
        ],
      ),
    );
  }
}
