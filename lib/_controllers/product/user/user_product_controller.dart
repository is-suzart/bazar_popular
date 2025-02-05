import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/state_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'user_product_controller.g.dart';

class UserProductController = UserProductControllerStore
    with _$UserProductController;

abstract class UserProductControllerStore with Store {
  int limit = 15;
  int offset = 0;
  final _productService = ProductService();

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @action
  Future getUserProducts() async {
    final String userId = await getInstance("user_id");
    final result = await _productService.getUserProducts(userId, limit, offset);
    if (result != null) {
      products.addAll(result);
    } else {
      products.clear();
    }
  }

  @action
  Future deleteProduct(String productId, BuildContext context) async {
    openAlertDialog(context, "essa ação não pode ser desfeita!",
        "Tem Certeza que deseja remover esse produto?", () async {
      final result = await _productService.turnProductInactive(productId);
      if (result) {
        products.removeWhere((element) => element.id == productId);
      }
    });
  }
}
