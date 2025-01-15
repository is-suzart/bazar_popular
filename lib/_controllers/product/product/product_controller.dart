import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerStore with _$ProductController;

abstract class ProductControllerStore with Store {

  final _productService = ProductService();
  final logger = Logger();

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