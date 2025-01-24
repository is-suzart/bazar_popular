import 'dart:convert';
import 'dart:typed_data';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  final logger = Logger();

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
      logger.e('Error fetching products: ${error.toString()}');
      return GetProductsResult(exception: error.toString());
    }
  }

    Future<GetProductsResult> getProducts(int? limit,int? offset) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/products' ,
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
      logger.e('Error fetching products: ${error.toString()}');
      return GetProductsResult(exception: error.toString());
    }
  }

  Future<GetProductsResult> getProductsByTitle(String title,int? limit,int? offset) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/products' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          
        ),
        queryParameters: {
          'limit': (limit ?? '15').toString(),
          'offset': (offset ?? '0').toString(),
          'title':title
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
      logger.e('Error fetching products: ${error.toString()}');
      return GetProductsResult(exception: error.toString());
    }
  }

    Future<GetProductsResult> getProductWithId(String id) async {
    //final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/products/$id' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            //'authorization': token,
          },
          
        ));
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
      logger.e('Error fetching products: ${error.toString()}');
      return GetProductsResult(exception: error.toString());
    }
  }

  Future<GetProductAndUserInfo> getProductWithIdAndUserInfo(String id) async {
    //final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/products/full/$id' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            //'authorization': token,
          },
          
        ));
      final result = response.data;
      if(response.statusCode == 200) {
        final data = ResponseGetProductAndUserInfo.fromJson(result);
        return GetProductAndUserInfo(success: data);
      } else {
        final data = ErrorResponse.fromJson(response.data);
        return GetProductAndUserInfo(error: data);
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return GetProductAndUserInfo(exception: error.toString());
    }
  }

  Future<bool> setFavoriteProduct(String productId,String userId) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.post('/users/favorite' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          
        ),
        data: jsonEncode({'user_id':userId,'product_id':productId})
        );
      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return false;
    }
  }
  Future<bool> getFavoriteProduct(String productId,String userId) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/users/favorite/$userId/$productId' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          }, 
        )
        );
      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return false;
    }
  }
  Future<bool> removeFavoriteProduct(String productID,String userId) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.delete('/users/favorite/$userId/$productID' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          
        )
        );
      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return false;
    }
  }
  Future<bool> turnProductInactive(String productID) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.post('/products/inactive/$productID' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
        )
        );
      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return false;
    }
  }
}
