import 'dart:typed_data';

import 'package:concord_foundation/concord_foundation.dart';

import 'target.dart';

abstract class ApiClient {
  Future<T> request<T>(Target target, Deserializer<T> deserializer);
  Future<Uint8List> requestData(Target target);
}
