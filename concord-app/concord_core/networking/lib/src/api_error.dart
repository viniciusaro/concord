import 'package:concord_foundation/exceptions.dart';
import 'package:concord_foundation/types.dart';
import 'package:dio/dio.dart';

extension ApiErrorX on ApiError {
  static ApiError fromError(Object error) {
    final dioError = error is DioError ? error as DioError : null;

    final finalError = dioError?.let((error) {
      return ApiErrorX.fromCode(error) ?? ApiErrorX.fromType(error);
    });

    return (finalError ?? UnknownServerError(error)) as ApiError;
  }

  static ApiError? fromCode(DioError error) {
    switch (error.response?.statusCode) {
      case 401:
        return UnauthorizedError(error);
      case 500:
        return InternalServerError(error);
    }
    return null;
  }

  static ApiError fromType(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeoutError(error);
      case DioErrorType.response:
        return InternalServerError(error, code: error.response?.statusCode);
      case DioErrorType.cancel:
        return RequestCanceledError(error);
      case DioErrorType.other:
        return UnknownServerError(error);
    }
  }
}
