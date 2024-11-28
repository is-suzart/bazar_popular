import 'dart:convert';
import 'package:bazar_popular/models/reponse_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {

  final String _baseUrl = 'http://localhost:8080';

  Future<LoginResult> login(String email, String password) async {
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

    final res = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      final ResponseLogin data = ResponseLogin.fromJson(res);
      await prefs.setString('auth_token', data.token);
      await prefs.setString('user_id', data.id);
      return LoginResult(success: data);
    } else {
      final ErrorResponse errorData = ErrorResponse.fromJson(res);
      return LoginResult(error: errorData);
    }
  } catch (e) {
    return LoginResult(exception: e.toString());
  }
}
}