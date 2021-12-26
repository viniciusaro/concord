import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:concord_foundation/concord_foundation.dart';
import 'package:networking/src/errors.dart';

import 'api_client.dart';
import 'http_method.dart';
import 'target.dart';

class ApiClientImpl with ApiClient {
  final Dio _dio;

  ApiClientImpl(this._dio);

  @override
  Future<T> request<T>(Target target, Deserializer<T> deserializer) {
    return requestData(target)
        .mapError(ApiError.fromError)
        .map((response) => response.toMap())
        .map(deserializer);
  }
}

extension on ApiClientImpl {
  Future<Response<Uint8List>> requestData(Target target) {
    final fullPath = target.baseUrl + target.path;

    final options = Options(
      contentType: target.contentType,
      responseType: ResponseType.bytes,
      headers: target.headers,
    );

    switch (target.method) {
      case HttpMethod.get:
        return _dio.get(
          fullPath,
          options: options,
          queryParameters: target.parameters as Map<String, dynamic>,
        );
      case HttpMethod.post:
        return _dio.post(
          fullPath,
          data: target.parameters,
          options: options,
        );
      case HttpMethod.put:
        return _dio.put(
          fullPath,
          data: target.parameters,
          options: options,
        );
      case HttpMethod.delete:
        return _dio.delete(
          fullPath,
          data: target.parameters,
          options: options,
        );
    }
  }
}

extension on Response<Uint8List> {
  Map<String, dynamic> toMap() {
    final bytes = const Utf8Codec().decode(data!);
    return json.decode(bytes) as Map<String, dynamic>;
  }
}
