import 'dart:async';

import 'package:bazar_popular/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
part 'header_controller.g.dart';

class HeaderController = HeaderControllerStore with _$HeaderController;


abstract class HeaderControllerStore with Store {

  final _productService = ProductService();



  @action
  onSelectedAction(BuildContext context, String item) {
    context.go("/$item");
  }

  @action
  typeAheadProducts(String term) async {
    final result = await _productService.getProductsByTitle(term,null,null);
    if(result != null){
      return result;
    }
  }

}