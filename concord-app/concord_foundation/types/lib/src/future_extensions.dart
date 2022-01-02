import 'dart:async';

extension FutureX<T> on Future<T> {
  Future<T> mapError<E extends Object>(E Function(Object) map) {
    return catchError((Object e) => throw map(e))._alsoReportInZone();
  }

  Future<U> map<U>(U Function(T) map) {
    return then(map);
  }

  Future<U> flatMap<U>(Future<U> Function(T) map) {
    return then(map);
  }

  Future<T> _alsoReportInZone() async {
    try {
      return await this;
    } catch (e, s) {
      final zone = Zone.current;
      zone.handleUncaughtError(e, s);
      rethrow;
    }
  }
}
