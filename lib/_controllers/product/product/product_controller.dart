import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/user_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/shared/emitter/emitter_store.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerStore with _$ProductController;

abstract class ProductControllerStore with Store {
  final _productService = ProductService();
  final EmitterStore _emitterStore = emitterStore;
  final logger = Logger();
  final customStylesQuill = DefaultStyles(
      h1: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.headlineMedium!
              .copyWith(color: primaryColor),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(16, 0),
          const VerticalSpacing(16, 0),
          null),
      h2: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.headlineSmall!
              .copyWith(color: primaryColor),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(16, 0),
          const VerticalSpacing(16, 0),
          null),
      h3: DefaultTextBlockStyle(
          bazarPopularTheme.textTheme.bodyLarge!
              .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
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
  

  @observable
  bool isFavorite = false;
  @computed
  ButtonStyle get favoriteButtonStyle => isFavorite == true
      ? TextButton.styleFrom(
          iconColor: Colors.red,
          textStyle: bazarPopularTheme.textTheme.bodyMedium!
              .copyWith(color: Colors.red))
      : TextButton.styleFrom(
          iconColor: greyColor,
          textStyle: bazarPopularTheme.textTheme.bodyMedium!
              .copyWith(color: greyColor));
  @action
  Future<void> getProduct(String id) async {
    isLoading = true;
    try {
      final productResult =
          await _productService.getProductWithIdAndUserInfo(id);
      if (productResult != null) {
        product = productResult.$1;
        user = productResult.$2;
        if (_emitterStore.isLogged){
          getFavoriteProduct(product!.id, _emitterStore.loggedUserId!);
        }
        isLoading = false;
      } else {
        logger.e("Não conseguimos pegar produto e usuário");
        isLoading = false;
      }
    } catch (e) {
      logger.e(e);
      isLoading = false;
    }
  }

  @action
  Future<void> setFavoriteProduct(String productId, String userId) async {
    if(isFavorite == false) {
      try {
        _productService.setFavoriteProduct(productId, userId);
        isFavorite = true;
      } catch (e) {
        logger.e(e);
      }
    } else {
      try {
        _productService.removeFavoriteProduct(productId, userId);
        isFavorite = false;
      } catch (e) {
        logger.e(e);
      }
    }

  }

  @action
  Future<void> getFavoriteProduct(String productId, String userId) async {
    try {
      final result = await _productService.getFavoriteProduct(productId, userId);
      isFavorite = result;
    } catch (e) {
      isFavorite = false;
    }
  }
}
