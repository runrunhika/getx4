import 'package:flutter/material.dart';
import 'package:getx5_sample/model/product.dart';

import 'product_image.dart';
import 'product_info.dart';

class ProductCard extends StatelessWidget {
  ProductModel? productModel;
  ProductCard({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Column(
        children: [
          ProductImage(productModel: productModel),
          ProductInfo(productModel: productModel),
        ],
      ),
    );
  }
}
