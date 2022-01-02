import 'package:concord_foundation/concord_foundation.dart';

abstract class StorageClient {
  Future<T?> get<T>(Deserializer<T> deserializer);
  Future<T> put<T>(T value, Serializer<T> serializer);
}
