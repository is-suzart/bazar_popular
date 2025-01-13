import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bazar_popular/_controllers/product/user/user_product_controller.dart';

class MyProduct extends StatelessWidget {
  final _userProductController = UserProductController();

  MyProduct({super.key}) {
    // Carregar produtos no construtor
    _userProductController.getUserProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (_userProductController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Text("tem dado ${_userProductController.products[0].info.title}"),
            Expanded(
              child: ListView.builder(
                itemCount: _userProductController.products.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(_userProductController.products[index].info.title),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
