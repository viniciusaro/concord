import 'package:concord_foundation/concord_foundation.dart';

import 'key_value_storage.dart';
import 'storage_client.dart';

export 'storage_client.dart';

class StorageClientImpl with StorageClient {
  final KeyValueStorage _keyValueStorage;

  StorageClientImpl(this._keyValueStorage);

  @override
  Future<T> get<T>(Deserializer<T> deserializer) {
    return _keyValueStorage.get(T.key).map(deserializer);
  }

  @override
  Future<T> put<T>(T value, Serializer<T> serializer) {
    return _keyValueStorage.put(T.key, serializer(value)).map((_) => value);
  }
}

extension Object<T> on T {
  String get key {
    return "$T";
  }
}
