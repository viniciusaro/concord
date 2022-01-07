import 'dart:developer';

extension StreamX<T> on Stream<T> {
  Stream<T> debug({
    String prefix = "",
    Function(String) logger = log,
    dynamic Function(T)? map,
  }) {
    return this.map((event) {
      final eventMap = map ?? (e) => e;
      logger("[${DateTime.now()}]: " + prefix + eventMap(event).toString());
      return event;
    }).handleError((Object e, s) {
      logger("[${DateTime.now()}]: ERROR" + prefix + e.toString());
      throw e;
    });
  }
}

extension StreamList<T> on Stream<Iterable<T>> {
  Stream<List<U>> mapEach<U>(U Function(T) transform) {
    return map((list) => list.map(transform).toList());
  }
}
