import 'base_error.dart';

abstract class ApiError<T> extends BaseError {}

class UnauthorizedError<T> extends ApiError<T> {
  @override
  int? get code => 401;
}

class InternalServerError<T> extends ApiError<T> {
  @override
  int? get code => 500;
}
