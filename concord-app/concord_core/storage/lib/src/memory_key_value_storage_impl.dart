import 'package:flutter/foundation.dart';

import 'key_value_storage.dart';

class MemoryKeyValueStorageImpl with KeyValueStorage {
  final Map<String, Map<String, dynamic>> _storage;

  MemoryKeyValueStorageImpl(this._storage);

  @override
  Future<Map<String, dynamic>?> get(String key) {
    final value = _storage[key];
    return value != null ? SynchronousFuture(value) : SynchronousFuture(null);
  }

  @override
  Future<Map<String, dynamic>> put(String key, Map<String, dynamic> value) {
    return SynchronousFuture(_storage[key] ??= value);
  }
}
