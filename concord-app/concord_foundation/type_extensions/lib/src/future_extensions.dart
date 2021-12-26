import 'package:base_exceptions/base_exceptions.dart';

extension FutureX<T> on Future<T> {
  Future<T> mapError<E extends BaseException>(E Function(dynamic) map) {
    return catchError((e) => throw map(e));
  }

  Future<U> map<U>(U Function(T) map) {
    return then(map);
  }

  Future<U> flatMap<U>(Future<U> Function(T) map) {
    return then(map);
  }
}
