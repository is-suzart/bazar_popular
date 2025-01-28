import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/models/user_models.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class UserService {
    final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  final logger = Logger();

  Future<UserModels?> getUserInfo(String id) async {
    try{
      final response = await _dio.get(
        '/users/$id',
         options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
        if(response.statusCode == 200) {
          return ResponseUser.fromJson(response.data).user;
        } else {
          return null;
        }
    }
    catch (err){
      logger.e(err);
      return null;
    }
  }
}