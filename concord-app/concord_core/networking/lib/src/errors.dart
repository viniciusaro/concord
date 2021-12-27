import 'package:concord_foundation/concord_foundation.dart';
import 'package:dio/dio.dart';

extension ApiErrorX<T> on ApiError<T> {
  static ApiError<T> fromError<T>(dynamic error) {
    return fromCode<T>((error as DioError).response?.statusCode);
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
