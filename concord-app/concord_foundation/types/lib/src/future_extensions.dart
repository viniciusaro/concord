import 'dart:async';

extension FutureX<T> on Future<T> {
  Future<T> mapError<E extends Object>(E Function(Object) map) {
    return catchError((Object e) => throw map(e));
  }

  Future<U> map<U>(U Function(T) map) {
    return then(map);
  }

  Future<U> flatMap<U>(Future<U> Function(T) map) {
    return then(map);
  }

  Stream<U> fold<U>({
    U Function(T)? onSuccess,
    U Function(Object)? onError,
    U Function()? always,
  }) async* {
    try {
      final data = await this;
      final result = onSuccess?.call(data);
      if (result != null) {
        yield result;
      }
    } catch (e, s) {
      final zone = Zone.current;
      zone.handleUncaughtError(e, s);
      final result = onError?.call(e);
      if (result != null) {
        yield result;
      }
    } finally {
      final result = always?.call();
      if (result != null) {
        yield result;
      }
    }
  }
}
