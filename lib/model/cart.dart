import 'package:getx5_sample/model/product.dart';

class CartModel extends ProductModel {
  int quantity = 0;

  CartModel({id, name, category, imageUrl, oldPricce, price, required this.quantity})
      : super(
            id: id,
            name: name,
            category: category,
            imageUrl: imageUrl,
            oldPrice: oldPricce,
            price: price);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final product = ProductModel.fromJson(json);
    final quantity = json['quantity'];
    return CartModel(
        id: product.id,
        name: product.name,
        category: product.category,
        imageUrl: product.imageUrl,
        oldPricce: product.oldPrice,
        price: product.price,
        quantity: quantity);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['oldPrice'] = this.oldPrice;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
