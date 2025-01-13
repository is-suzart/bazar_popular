import 'dart:convert';
import 'dart:typed_data';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<CreateProductResult> createProduct(CreateProductModel values) async {
    final token = await getInstace('auth_token');
    final jsonValues = values.toJson();
    try {
      final response = await _dio.post(
        '/products',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
        ),
        data: jsonEncode(jsonValues),
      );
      final result = response.data;
      if (response.statusCode == 201) {
        final data = ResponseCreateProduct.fromJson(result);
        return CreateProductResult(success: data);
      } else {
        final data = ErrorResponse.fromJson(result);
        return CreateProductResult(error: data);
      }
    } catch (err) {
      return CreateProductResult(exception: err.toString());
    }
  }

  Future uploadProduct(UploadProductFormModel form) async {
    final token = await getInstace('auth_token');

    try {
      _dio.options.headers = {
        'authorization': token,
        'Content-Type': 'multipart/form-data',
      };
      FormData formData = FormData();
      formData.fields.addAll([
        MapEntry('id', form.id),
        MapEntry('pixType', form.pixType),
        MapEntry('pixKey', form.pixKey),
        MapEntry('description', form.description),
      ]);

      for (var picture in form.pictures) {
        XFile file = XFile(picture.path);
        Uint8List content = await file.readAsBytes();
        formData.files.add(MapEntry(
            'pictures',
            MultipartFile.fromBytes(content,
                filename: picture.name)));
      }

      final response = await _dio.post('/products/finish', data: formData);

      if (response.statusCode == 200) {
        final data = ResponseUpdateCreateProduct.fromJson(response.data);
        return UpdateCreateProductResult(success: data);
      } else {
        final data = ErrorResponse.fromJson(response.data);
        return UpdateCreateProductResult(error: data);
      }
    } catch (error) {
      return UpdateCreateProductResult(exception: error.toString());
    }
  }

  Future<GetProductsResult> getUserProducts(String userId,int? limit,int? offset) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/users/$userId/products' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          
        ),
        queryParameters: {
          'limit': (limit ?? '15').toString(),
          'offset': (offset ?? '0').toString()
        });
      final result = response.data;
      if(response.statusCode == 200) {
        final data = ResponseGetProducts.fromJson(result);
        return GetProductsResult(success: data);
      } else {
        final data = ErrorResponse.fromJson(response.data);
        return GetProductsResult(error: data);
      }
    }
    catch (error) {
      print(error);
      return GetProductsResult(exception: error.toString());
    }
  }

    Future<GetProductsResult> getProducts(int? limit,int? offset) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/user/products' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          
        ),
        queryParameters: {
          'limit': (limit ?? '15').toString(),
          'offset': (offset ?? '0').toString()
        });
      final result = jsonDecode(utf8.decode(response.data));
      if(response.statusCode == 200) {
        final data = ResponseGetProducts.fromJson(result);
        return GetProductsResult(success: data);
      } else {
        final data = ErrorResponse.fromJson(response.data);
        return GetProductsResult(error: data);
      }
    }
    catch (error) {
      return GetProductsResult(exception: error.toString());
    }
  }
  
}
