import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/user_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/services/user_service.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerStore with _$ProductController;

abstract class ProductControllerStore with Store {
  final _productService = ProductService();
  final _userService = UserService();
  final logger = Logger();
  final customStylesQuill = DefaultStyles(
      h1: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.headlineMedium!.copyWith(color: primaryColor),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(16, 0),
          const VerticalSpacing(16, 0),
          null),
      h2: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.headlineSmall!.copyWith(color: primaryColor),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(16, 0),
          const VerticalSpacing(16, 0),
          null),
      h3: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.bodyLarge!.copyWith(color: primaryColor,fontWeight: FontWeight.bold),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(16, 0),
          const VerticalSpacing(16, 0),
          null),
      bold: bazarPopularTheme.textTheme.bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
      italic: bazarPopularTheme.textTheme.bodyMedium!
          .copyWith(fontStyle: FontStyle.italic),
      paragraph: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.bodyMedium!,
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(16, 0),
          const VerticalSpacing(16, 0),
          null));
  @observable
  Product? product;
  @observable
  UserModels? user;
  @observable
  bool isLoading = true;

  @action
  Future<void> getProduct(String id) async {
    isLoading = true;
    try {
      final productResult = _productService.getProductWithId(id);
      final userResult = productResult.then((productResult) {
        if (productResult.isSuccess) {
          product = productResult.success!.products[0];
          return _userService.getUserInfo(product!.userId);
        } else {
          throw Exception("Failed to load product");
        }
      });
      final results = await Future.wait([productResult, userResult]);
      if ((results[0] as Result).isSuccess &&
          (results[1] as Result).isSuccess) {
        user = (results[1] as Result).success!.user;
      }
      isLoading = false;
    } catch (e) {
      logger.e(e);
      isLoading = false;
    }
  }
}
