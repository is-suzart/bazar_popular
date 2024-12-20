import 'dart:convert';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
        MapEntry('pixType', form.pixType),
        MapEntry('pixKey', form.pixKey),
        MapEntry('description', form.description),
      ]);

      for (var picture in form.pictures) {
        formData.files.add(MapEntry(
            'pictures',
            await MultipartFile.fromFile(picture.path,
                filename: picture.name)));
      }

      final response = await _dio.post('/products', data: formData);

      if (response.statusCode == 200) {
      } else {}
    } catch (err) {}
  }
}
