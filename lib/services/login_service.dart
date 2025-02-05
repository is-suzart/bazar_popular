import 'dart:convert';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/shared/emitter/emitter_store.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final String _baseUrl = 'http://localhost:8080';
  final _logger = Logger();
  final _emitterStore = emitterStore;

  Future<(String, String)?> login(String email, String password) async {
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
        await setInstance('auth_token', data.token);
        await setInstance('user_id', data.id);
        _emitterStore.updateUserInfo(data.id);
        return (data.token, data.id);
      } else {
        return null;
      }
    } catch (err) {
      _logger.e(err);
      return null;
    }
  }

  Future<(String, String)?> signUp(Map formValues) async {
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
      if (response.statusCode == 201) {
        final ResponseSign data = ResponseSign.fromJson(result);
        await prefs.setString('auth_token', data.token);
        await prefs.setString('user_id', data.id);
        return (data.token, data.id);
      } else {
        return null;
      }
    } catch (err) {
      _logger.e(err);
      return null;
    }
  }
}
