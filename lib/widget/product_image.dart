import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getx5_sample/model/product.dart';

class ProductImage extends StatelessWidget {
  ProductModel? productModel;
  ProductImage({this.productModel});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: productModel!.imageUrl,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Icon(Icons.image),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
