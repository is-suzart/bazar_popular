import 'dart:convert';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {

  final String _baseUrl = 'http://localhost:8080';

  Future<SignResult> login(String email, String password) async {
  final prefs = await SharedPreferences.getInstance();

  try {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'Bearer seu-token-aqui',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final result = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      final ResponseSign data = ResponseSign.fromJson(result);
      await prefs.setString('auth_token', data.token);
      await prefs.setString('user_id', data.id);
      return SignResult(success: data);
    } else {
      final ErrorResponse errorData = ErrorResponse.fromJson(result);
      return SignResult(error: errorData);
    }
  } catch (err) {
    return SignResult(exception: err.toString());
  }
}

Future<SignResult> signUp(Map formValues) async {
  final prefs = await SharedPreferences.getInstance();
  try {
    final response = await http.post(
      Uri.parse('$_baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(formValues),
    );
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 201){
      final ResponseSign data = ResponseSign.fromJson(result);
      await prefs.setString('auth_token', data.token);
      await prefs.setString('user_id', data.id);
      return SignResult(success: data);
    } else {
        final ErrorResponse errorData = ErrorResponse.fromJson(result);
        return SignResult(error: errorData);
    }

  }
  catch (err) {
    return SignResult(exception: err.toString());
  }
}
}