import 'base_error.dart';

abstract class ApiError extends BaseError {
  @override
  final Object? error;

  ApiError(this.error);
}

class UnauthorizedError extends ApiError {
  @override
  int? get code => 401;

  UnauthorizedError(Object error) : super(error);
}

class InternalServerError extends ApiError {
  @override
  final int? code;

  InternalServerError(Object error, {this.code = 500}) : super(error);
}

class TimeoutError extends ApiError {
  @override
  bool get reportIfUnhandled => true;

  TimeoutError(Object error) : super(error);
}

class RequestCanceledError extends ApiError {
  RequestCanceledError(Object error) : super(error);
}

class UnknownServerError extends ApiError {
  UnknownServerError(Object error) : super(error);
}
