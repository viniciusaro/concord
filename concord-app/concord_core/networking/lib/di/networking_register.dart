import 'package:auth/auth.dart';
import 'package:concord_foundation/di.dart';

import 'package:dio/dio.dart';

import '../src/api_client_impl.dart';

class NetworkingRegister with Register {
  @override
  void register(Getter get, Setter set, SingletonSetter setSingleton) {
    setSingleton(
      () {
        final dio = Dio();
        dio.interceptors.add(get<AuthInterceptor>());
        return dio;
      },
    );
    set(() => ApiClientImpl(get()) as ApiClient);
  }
}
