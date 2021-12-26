import 'package:firebase_auth/firebase_auth.dart';
import 'package:networking/networking.dart';

class AuthInterceptor with Interceptor {
  final FirebaseAuth _auth;

  AuthInterceptor(this._auth);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _auth.currentUser?.getIdToken().then((token) {
          options.headers["Authorization"] = "Bearer " + token;
          handler.next(options);
        }).catchError((e) {
          handler.next(options);
        }) ??
        handler.next(options);
  }
}
