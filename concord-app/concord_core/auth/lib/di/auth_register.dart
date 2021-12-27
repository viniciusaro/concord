import 'package:auth/src/auth_client_impl.dart';
import 'package:concord_foundation/concord_foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../src/auth_client.dart';
import '../src/auth_interceptor.dart';

class AuthRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => FirebaseAuth.instance);
    set(() => AuthInterceptor(get()));
    set(() => AuthClientImpl(get(), get()) as AuthClient);
  }
}
