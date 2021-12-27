import 'package:concord_foundation/concord_foundation.dart';

abstract class KeyValueStorage {
  Future<Map<String, dynamic>> put(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>> get(String key);
}

class KeyNotFoundException with BaseException {}
