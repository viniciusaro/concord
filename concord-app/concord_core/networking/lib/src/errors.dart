import 'package:concord_foundation/concord_foundation.dart';
import 'package:dio/dio.dart';

abstract class ApiError<T> extends BaseException {
  static ApiError<T> fromError<T>(dynamic error) {
    error = error as DioError;
    return ApiError.fromCode<T>(error.response?.statusCode);
  }

  static ApiError<T> fromCode<T>(int? code) {
    switch (code) {
      case 401:
        return UnauthorizedError<T>();
      case 500:
        return InternalServerError<T>();
    }
    return InternalServerError<T>();
  }
}

class DeserializationError<T> extends BaseException {
  final String? data;

  DeserializationError(this.data);

  @override
  String? get message => "Error trying to deserialize $T from data: $data";
}

class UnauthorizedError<T> extends ApiError<T> {
  @override
  int? get code => 401;
}

class InternalServerError<T> extends ApiError<T> {
  @override
  int? get code => 500;
}
