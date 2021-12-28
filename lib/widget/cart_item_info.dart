import 'package:flutter/material.dart';
import 'package:getx5_sample/model/cart.dart';
import 'package:getx5_sample/state/cart_state.dart';

class CartItemInfo extends StatelessWidget {
  const CartItemInfo({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 8, right: 8),
            child: Text(
              cartModel.name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 8, right: 8),
              child: Row(
                mainAxisSize:
                    MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    cartModel.price,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold),
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
