import 'package:bazar_popular/models/user_models.dart';


class LoginResult {
  final ResponseLogin? success;
  final ErrorResponse? error;
  final String? exception;

  LoginResult({this.success, this.error, this.exception});

  bool get isSuccess => success != null;
  bool get isError => error != null;
  bool get isException => exception != null;
}


class ResponseUser{
    String status;
    UserModels user;

    ResponseUser(this.status, this.user);
}

class ResponseLogin{
    String status;
    String token;
    String id;

    ResponseLogin(this.status, this.token,this.id);

    factory ResponseLogin.fromJson(Map<String, dynamic> json) {
        return ResponseLogin(
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