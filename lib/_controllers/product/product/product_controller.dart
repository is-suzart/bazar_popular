import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerStore with _$ProductController;

abstract class ProductControllerStore with Store {

  final _productService = ProductService();
  final logger = Logger();
  final customStylesQuill = DefaultStyles(
    h1: DefaultTextBlockStyle( bazarPopularTheme.textTheme.headlineLarge!, 
     const HorizontalSpacing(0, 0), 
     const VerticalSpacing(16, 0), 
     const VerticalSpacing(16, 0),
     null
     ),
     h2:  DefaultTextBlockStyle( bazarPopularTheme.textTheme.headlineMedium!, 
     const HorizontalSpacing(0, 0), 
     const VerticalSpacing(16, 0), 
     const VerticalSpacing(16, 0),
     null
     ),
     h3:  DefaultTextBlockStyle( bazarPopularTheme.textTheme.headlineSmall!, 
     const HorizontalSpacing(0, 0), 
     const VerticalSpacing(16, 0), 
     const VerticalSpacing(16, 0),
     null
     ),
     bold: bazarPopularTheme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
     italic: bazarPopularTheme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
     paragraph: DefaultTextBlockStyle( bazarPopularTheme.textTheme.bodyMedium!, 
     const HorizontalSpacing(0, 0), 
     const VerticalSpacing(16, 0), 
     const VerticalSpacing(16, 0),
     null
     )
  );
  @observable late Product product;
  @observable bool isLoading = true;



  @action
  getProduct(String id) async {
    isLoading = true;
    try{
      final result = await _productService.getProductWithId(id);
      if(result.isSuccess){
        product = result.success!.products[0];
        isLoading = false;
      } else {
      }
    } catch (e) {
      logger.e(e);
    }
    
  }
}