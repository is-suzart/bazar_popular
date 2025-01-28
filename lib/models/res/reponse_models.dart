import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/user_models.dart';

class ResponseSign{
    String token;
    String id;

    ResponseSign(this.token,this.id);

    factory ResponseSign.fromJson(Map<String, dynamic> json) {
        return ResponseSign(// Valor padrão vazio caso a chave não exista
        json['token'] ?? "",
        json['id'] ?? "",
        );
    }
}

class ResponseCreateProduct{
  final String productId;

  ResponseCreateProduct({required this.productId});

  factory ResponseCreateProduct.fromJson(Map<String, dynamic> json) {
    return ResponseCreateProduct(
      productId: json['productId'] ?? ''
    );
  }
}

class ResponseUpdateCreateProduct{
  final String status;
  final String message;
  final int modified;

  ResponseUpdateCreateProduct({required this.status, required this.message, required this.modified});

    factory ResponseUpdateCreateProduct.fromJson(Map<String, dynamic> json) {
    return ResponseUpdateCreateProduct(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      modified: json['modified'] ?? 0
    );
  }
}

class ResponseGetProducts{
  final List<Product> products;

  factory ResponseGetProducts.fromJson(Map<String, dynamic> json) {
    final productsData = json['products'];
    return ResponseGetProducts(
      products:  productsData is List
          ? productsData.map((item) => Product.fromJson(item as Map<String, dynamic>)).toList()
          : productsData is Map<String, dynamic>
              ? [Product.fromJson(productsData)]
              : []
    );
  }

  ResponseGetProducts({required this.products});
}
class ResponseGetProductAndUserInfo{
  final String status;
  final String message;
  final Product products;
  final UserModels user;

  factory ResponseGetProductAndUserInfo.fromJson(Map<String, dynamic> json) {
    final productsData = json['products'];
    return ResponseGetProductAndUserInfo(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      products:  Product.fromJson(productsData),
      user: UserModels.fromJson(json['user'])
    );
  }

  ResponseGetProductAndUserInfo({required this.status, required this.message, required this.products,required this.user});
}

class SignResult extends Result<ResponseSign> {
  SignResult({super.success, super.error, super.exception});
}

class CreateProductResult extends Result<ResponseCreateProduct> {
  CreateProductResult({super.success, super.error, super.exception});
}

class UpdateCreateProductResult extends Result<ResponseUpdateCreateProduct> {
  UpdateCreateProductResult({super.success, super.error, super.exception});
}

class GetProductsResult extends Result<ResponseGetProducts> {
    GetProductsResult({super.success, super.error, super.exception});
}
class GetUserResult extends Result<ResponseUser>{
  GetUserResult({super.success,super.error,super.exception});
}
class GetProductAndUserInfo extends Result<ResponseGetProductAndUserInfo>{
  GetProductAndUserInfo({super.success,super.error,super.exception});
}
class ResponseUser{
    UserModels user;

    ResponseUser({required this.user});

    factory ResponseUser.fromJson(Map<String, dynamic> json) {
      final userData = json['user'];
      return ResponseUser(
        user: UserModels.fromJson(userData));
    }
}