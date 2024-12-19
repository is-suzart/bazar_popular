class Result<T> {
  final T? success;
  final ErrorResponse? error;
  final String? exception;

  Result({this.success, this.error, this.exception});

  bool get isSuccess => success != null;
  bool get isError => error != null;
  bool get isException => exception != null;
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