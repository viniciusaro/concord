import 'package:concord_foundation/concord_foundation.dart';
import 'package:dio/dio.dart';
import 'package:networking/src/api_client_impl.dart';

import 'target.dart';

abstract class ApiClient {
  Future<T> request<T>(Target target, Deserializer<T> deserializer);

  factory ApiClient.defaultClient() {
    return ApiClientImpl(Dio());
  }
}
