import 'package:concord_foundation/concord_foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'key_value_storage.dart';

export 'key_value_storage.dart';

class HiveKeyValueStorageImpl with KeyValueStorage {
  final Box<Map<String, dynamic>> box;

  HiveKeyValueStorageImpl(this.box);

  @override
  Future<Map<String, dynamic>> get(String key) {
    if (box.containsKey(key)) {
      return SynchronousFuture(box.get(key)!);
    }
    return Future.error(KeyNotFoundException());
  }

  @override
  Future<Map<String, dynamic>> put(String key, Map<String, dynamic> value) {
    return SynchronousFuture(box.put(key, value)).map((_) => value);
  }
}
