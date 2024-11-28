import 'package:bazar_popular/models/user_models.dart';


class SignResult {
  final ResponseSign? success;
  final ErrorResponse? error;
  final String? exception;

  SignResult({this.success, this.error, this.exception});

  bool get isSuccess => success != null;
  bool get isError => error != null;
  bool get isException => exception != null;
}


class ResponseUser{
    String status;
    UserModels user;

    ResponseUser(this.status, this.user);
}

class ResponseSign{
    String status;
    String token;
    String id;

    ResponseSign(this.status, this.token,this.id);

    factory ResponseSign.fromJson(Map<String, dynamic> json) {
        return ResponseSign(
        json['status'] ?? "", // Valor padrão vazio caso a chave não exista
        json['token'] ?? "",
        json['id'] ?? "",
        );
    }
}


class ErrorResponse{
    String status;
    String message;

    ErrorResponse(this.status, this.message);
    factory ErrorResponse.fromJson(Map<String, dynamic> json) {
        return ErrorResponse(
        json['status'] ?? "",
        json['message'] ?? "",
        );
    }
}