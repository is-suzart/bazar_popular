import 'dart:convert';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:http/http.dart' as http;

class ProductService {
    final String _baseUrl = 'http://localhost:8080';

    Future createProduct (CreateProductModel values) async {
        final token = await getInstace('auth_token');
        final jsonValues = values.toJson();
        try {
          final response = await http.post(
            Uri.parse('$_baseUrl/products'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': token,
          },
          body: jsonEncode(jsonValues)
          );
          final result = jsonDecode(utf8.decode(response.bodyBytes));
          if(response.statusCode == 201) {
            final data = ResponseCreateProduct.fromJson(result);
            return CreateProductResult(success: data);
          } else {
            final data = ErrorResponse.fromJson(result);
            return CreateProductResult(error: data);
          }
        }
        catch (err) {
          return CreateProductResult(exception: err.toString());
        }
    }

}

