import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {

  final String _baseUrl = 'http://localhost:8080';

  login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer seu-token-aqui'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final token = data['token'];
        await prefs.setString('auth_token', token);
        await prefs.setString('user_id', data['id']);
        return data;
      } else {
        final data = jsonDecode(utf8.decode(response.bodyBytes));

        return data;
      }
    } catch (e) {
      return e;
      }
    
  }
}