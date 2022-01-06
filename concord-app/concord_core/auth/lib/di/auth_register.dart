import 'package:concord_foundation/di.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../src/auth_client_impl.dart';
import '../src/auth_interceptor.dart';

class AuthRegister with Register {
  @override
  void register(Getter get, Setter set, SingletonSetter setSingleton) {
    set(() => FirebaseAuth.instance);
    set(() => AuthInterceptor(get()));
    set(() => AuthClientImpl(get(), get()) as AuthClient);
  }
}
