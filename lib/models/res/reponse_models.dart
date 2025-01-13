import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/user_models.dart';

class ResponseSign{
    String status;
    String token;
    String id;

    ResponseSign(this.status, this.token,this.id);

    factory ResponseSign.fromJson(Map<String, dynamic> json) {
        return ResponseSign(
        json['status'] ?? "", // Valor padrão vazio caso a chave não exista
        json['token'] ?? "",
        json['id'] ?? "",
        );
    }
}

class ResponseCreateProduct{
  final String status;
  final String productId;
  final String message;

  ResponseCreateProduct({required this.status, required this.productId, required this.message});

  factory ResponseCreateProduct.fromJson(Map<String, dynamic> json) {
    return ResponseCreateProduct(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
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
  final String status;
  final String message;
  final List<Product> products;

  factory ResponseGetProducts.fromJson(Map<String, dynamic> json) {
    return ResponseGetProducts(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      products: (json['products'] as List<dynamic>?) ?.map((item) => Product.fromJson(item as Map<String, dynamic>)) .toList() ?? []
    );
  }

  ResponseGetProducts({required this.status, required this.message, required this.products});
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

class ResponseUser{
    String status;
    UserModels user;

    ResponseUser(this.status, this.user);
}