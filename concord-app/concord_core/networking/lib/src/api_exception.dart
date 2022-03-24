import 'package:concord_foundation/exceptions.dart';
import 'package:concord_foundation/types.dart';
import 'package:dio/dio.dart';

class ApiException extends BaseException {
  ApiException(Object error, Extras extras) : super(error, extras: extras);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(Object error, Extras extras) : super(error, extras);
}

class InternalServerException extends ApiException {
  InternalServerException(Object error, Extras extras) : super(error, extras);
}

class RequestCanceledException extends ApiException {
  RequestCanceledException(Object error, Extras extras) : super(error, extras);
}

class UnknownServerException extends ApiException {
  UnknownServerException(Object error, Extras extras) : super(error, extras);
}

class TimeoutError extends ApiException {
  TimeoutError(Object error, Extras extras) : super(error, extras);
}

///
extension ApiExceptionX on ApiException {
  static Exception fromError(Object error) {
    final dioError = error is DioError ? error as DioError : null;
    final finalError = dioError?.let((error) => ApiExceptionX.fromDio(error));
    return finalError ?? UnknownServerException(error, {});
  }

  static Exception fromDio(DioError error) {
    final extras = {
      "request_path": error.requestOptions.path,
      "request_method": error.requestOptions.method,
      "request_query_parameters": error.requestOptions.queryParameters,
      "request_body": error.requestOptions.data,
      "response_headers": error.response?.headers,
      "response_body": error.response?.data,
      "response_status_code": error.response?.statusCode,
      "response_status_message": error.response?.statusMessage,
    };

    switch (error.response?.statusCode) {
      case 401:
        return UnauthorizedException(error, extras);
      case 500:
        return InternalServerException(error, extras);
    }

    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeoutError(error, extras);
      case DioErrorType.response:
        return InternalServerException(error, extras);
      case DioErrorType.cancel:
        return RequestCanceledException(error, extras);
      case DioErrorType.other:
        return UnknownServerException(error, extras);
    }
  }
}
