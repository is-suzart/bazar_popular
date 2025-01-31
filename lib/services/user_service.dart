import 'dart:convert';
import 'dart:typed_data';

import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/models/user_models.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
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
          var user = ResponseUser.fromJson(response.data).user;
          return user;
        } else {
          return null;
        }
    }
    catch (err){
        logger.e(err);
      return null;
    }
  }
  Future<String?> updateProfilePicture(String image,String userId) async {
    final token = await getInstace('auth_token');
    try {
      FormData formData = FormData();
      XFile file = XFile(image);
      Uint8List content = await file.readAsBytes();
      formData.files.add(MapEntry(
      'file',
      MultipartFile.fromBytes(content,
                filename: 'profile_picture.jpg',
                contentType: DioMediaType.parse('image/jpeg'))));
      final response = await _dio.post(
        '/users/$userId/profile-picture',
        options: Options(
          headers: {
            'authorization': token,
            'Content-Type': 'multipart/form-data',
          },
        ),
        data: formData,
      );
      final result = response.data;
      if (response.statusCode == 200) {
        final data = result['file_path'];
        return data;
      } else {
        return null;
      }
    } catch (err) {
      logger.e(err);
      return null;
    }

  }
}