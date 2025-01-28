import 'dart:convert';
import 'dart:typed_data';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/models/user_models.dart';
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

  Future<String?> createProduct(CreateProductModel values) async {
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
        final data = result['productId'];
        return data;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }

  Future<bool> uploadProduct(UploadProductFormModel form) async {
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
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<List<Product>?> getUserProducts(String userId,int? limit,int? offset) async {
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
        final data = ResponseGetProducts.fromJson(result).products;
        return data;
      } else {
        return null;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return null;
    }
  }

    Future<List<Product>?> getProducts(int? limit,int? offset) async {
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
        final data = ResponseGetProducts.fromJson(result).products;
        return data;
      } else {
        return null;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return null;
    }
  }

  Future<List<Product>?> getProductsByTitle(String title,int? limit,int? offset) async {
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
        return ResponseGetProducts.fromJson(result).products;
      } else {
        return null;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return null;
    }
  }

    Future<List<Product>?> getProductWithId(String id) async {
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
        return ResponseGetProducts.fromJson(result).products;
      } else {
        return null;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return null;
    }
  }

  Future<(Product,UserModels)?> getProductWithIdAndUserInfo(String id) async {
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
        return (data.products,data.user);
      } else {
        return null;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return null;
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
  Future<List<Product>?> getUserFavorites(String userId) async {
    final token = await getInstace('auth_token');
    try {
      final response = await _dio.get('/users/favorite/$userId' ,
      options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          
        )
        );
      if(response.statusCode == 200) {
        final result = response.data;
        final data = ResponseGetProducts.fromJson(result);
        return data.products;
      } else {
        return null;
      }
    }
    catch (error) {
      logger.e('Error fetching products: ${error.toString()}');
      return null;
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
