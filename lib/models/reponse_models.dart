import 'package:bazar_popular/models/user_models.dart';
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
}