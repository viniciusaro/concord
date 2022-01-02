import 'package:concord_foundation/di.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../src/hive_key_value_storage_impl.dart';
import '../src/storage_client_impl.dart';

class StorageRegister with Register {
  final Box<Map<String, dynamic>> mainBox;

  StorageRegister(this.mainBox);

  @override
  void register(Getter get, Setter set) {
    set(() => StorageClientImpl(get()) as StorageClient);
    set(() => HiveKeyValueStorageImpl(mainBox) as KeyValueStorage);
  }
}
