import 'package:concord_foundation/concord_foundation.dart';

import 'key_value_storage.dart';

class MemoryKeyValueStorageImpl with KeyValueStorage {
  final Map<String, Map<String, dynamic>> _storage;

  MemoryKeyValueStorageImpl(this._storage);

  @override
  Future<Map<String, dynamic>> get(String key) {
    final value = _storage[key];
    return value != null
        ? SynchronousFuture(value)
        : Future.error(KeyNotFoundError());
  }

  @override
  Future<Map<String, dynamic>> put(String key, Map<String, dynamic> value) {
    return SynchronousFuture(_storage[key] ??= value);
  }
}
