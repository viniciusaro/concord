import 'package:concord_foundation/di.dart';

import 'package:dio/dio.dart';

import '../src/api_client_impl.dart';

class NetworkingRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => Dio());
    set(() => ApiClientImpl(get()) as ApiClient);
  }
}
