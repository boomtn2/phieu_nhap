import 'package:phieu_nhap/core/data/models/response.dart';

class SuccessResponse<T> extends Response {
  int? statusCode;
  T? data;
  String? message;

  SuccessResponse({
    this.statusCode,
    this.data,
    this.message,
  });
}
