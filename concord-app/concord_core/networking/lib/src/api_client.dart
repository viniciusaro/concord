import 'package:dio/dio.dart';
import 'package:networking/src/api_client_impl.dart';

import 'target.dart';

typedef Deserializer<T> = T Function(Map<String, dynamic>);

abstract class ApiClient {
  Future<T> request<T>(Target target, Deserializer<T> deserializer);

  factory ApiClient.defaultClient() {
    return ApiClientImpl(Dio());
  }
}