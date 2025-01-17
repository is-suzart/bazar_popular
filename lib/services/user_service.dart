import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class UserService {
    final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  final logger = Logger();

  Future<GetUserResult> getUserInfo(String id) async {
    try{
      final response = await _dio.get(
        '/user/$id',
         options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
        if(response.statusCode == 200) {
          final data = ResponseUser.fromJson(response.data);
          return GetUserResult(success: data);
        } else {
          final error = ErrorResponse.fromJson(response.data);
          return GetUserResult(error: error);
        }
    }
    catch (err){
      logger.e(err);
      return GetUserResult(exception: err.toString());
    }
  }
}