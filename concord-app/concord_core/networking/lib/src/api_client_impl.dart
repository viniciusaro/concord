import 'dart:convert';
import 'dart:typed_data';

import 'package:concord_foundation/exceptions.dart';
import 'package:concord_foundation/serialization.dart';
import 'package:concord_foundation/types.dart';
import 'package:dio/dio.dart';

import 'api_client.dart';
import 'api_error.dart';
import 'http_method.dart';
import 'target.dart';

export 'api_client.dart';

class ApiClientImpl with ApiClient {
  final Dio _dio;

  ApiClientImpl(this._dio);

  @override
  Future<T> request<T>(Target target, Deserializer<T> deserializer) {
    return _dio
        .requestData(target)
        .mapError(ApiErrorX.fromError)
        .map((response) => response.toMap())
        .map(deserializer)
        .mapError((e) => DeserializationError<T>("", e));
  }

  @override
  Future<Uint8List> requestData(Target target) {
    return _dio
        .requestData(target)
        .mapError(ApiErrorX.fromError)
        .map((response) => response.data ?? Uint8List(0));
  }
}

extension on Dio {
  Future<Response<Uint8List>> requestData(Target target) {
    final fullPath = target.baseUrl + target.path;

    final options = Options(
      contentType: target.contentType,
      responseType: ResponseType.bytes,
      headers: target.headers,
    );

    switch (target.method) {
      case HttpMethod.get:
        return get(
          fullPath,
          options: options,
          queryParameters: target.parameters as Map<String, dynamic>,
        );
      case HttpMethod.post:
        return post(
          fullPath,
          data: target.parameters,
          options: options,
        );
      case HttpMethod.put:
        return put(
          fullPath,
          data: target.parameters,
          options: options,
        );
      case HttpMethod.delete:
        return delete(
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
