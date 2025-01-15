import 'package:bazar_popular/_controllers/product/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductPage extends StatelessWidget {
  final String id;
  final _productController = ProductController();
  ProductPage({super.key,required this.id}) {
    _productController.getProduct(id);
  }
  

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
        if (_productController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Text(_productController.product.toString());
        }
    });
  }

}