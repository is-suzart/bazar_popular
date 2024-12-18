import 'dart:convert';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductService {
    final String _baseUrl = 'http://localhost:8080';

    Future CreateProduct (CreateProductModel values) async {
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
        }
        catch (err) {
          print(err);
        }
    }

}

