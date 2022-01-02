abstract class KeyValueStorage {
  Future<Map<String, dynamic>> put(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> get(String key);
}
