import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx5_sample/model/cart.dart';
import 'package:getx5_sample/model/product.dart';
import 'package:getx5_sample/screens/cart_detail.dart';
import 'package:getx5_sample/state/cart_state.dart';

import 'utils/utils.dart';
import 'widget/product_card.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(MyCartController());
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      String cartSave = 'Cart';
      if (cartSave.length != 0 && cartSave.isNotEmpty) {
        final listCart = jsonDecode(cartSave) as List<dynamic>;
        final listCartParsed =
            listCart.map((e) => CartModel.fromJson(e)).toList();
        if (listCartParsed.length > 0) {
          controller.cart.value = listCartParsed;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: readJsonDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              var listProduct = snapshot.data as List<ProductModel>;
              return Padding(
                padding: const EdgeInsets.all(8),
                child: listProduct.length == 0
                    ? Center(
                        child: Text('No Item'),
                      )
                    : ListView.builder(
                        itemCount: listProduct.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(productModel: listProduct[index]);
                        },
                      ),
              );
            }
          },
        ),
        floatingActionButton: Obx(() => Badge(
              position: BadgePosition(top: 0, end: 1),
              animationDuration: Duration(milliseconds: 200),
              animationType: BadgeAnimationType.scale,
              showBadge: true,
              badgeColor: Colors.red,
              badgeContent: Text(
                controller.getQuantity() > 9
                    ? '9+'
                    : '${controller.getQuantity()}',
                style: TextStyle(color: Colors.white),
              ),
              child: FloatingActionButton(
                onPressed: () => Get.to(() => CartDetailScreen()),
                child: Icon(Icons.shopping_cart),
              ),
            )),
      ),
    );
  }
}
