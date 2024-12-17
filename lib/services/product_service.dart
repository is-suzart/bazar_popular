import 'package:bazar_popular/models/product_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductService {
    final String _baseUrl = 'http://localhost:8080';

    Future CreateProduct (CreateProductModel values) async {
        final prefs = await SharedPreferences.getInstance();
        try {
          final response = await http.post(
            Uri.parse('$_baseUrl/login'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer seu-token-aqui',
          },
          );
        }
        catch (err) {

        }
    }

}

