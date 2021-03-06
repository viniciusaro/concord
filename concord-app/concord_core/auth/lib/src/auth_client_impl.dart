import 'package:concord_foundation/types.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:networking/networking.dart';
import 'package:shared_models/shared_models.dart';

import 'auth_client.dart';
import 'auth_target.dart';
import 'sign_in_response.dart';

export 'auth_client.dart';

class AuthClientImpl implements AuthClient {
  final ApiClient _api;
  final FirebaseAuth _auth;

  AuthClientImpl(this._api, this._auth);

  @override
  Future<void> sendOtp(String alias) {
    return _api
        .requestData(AuthTarget.sendOtp(alias))
        .mapError((e) => AuthOtpException(e));
  }

  @override
  Future<User> signIn(String otp) {
    return signInWithFirebase(otp).mapError((e) {
      return e is FirebaseAuthException
          ? AuthProviderException(e)
          : AuthUnknownException(e);
    });
  }

  @override
  Future<User> signOut() {
    return _auth.signOut().map((_) => UnauthenticatedUser()).mapError((e) {
      return e is FirebaseAuthException
          ? AuthProviderException(e)
          : AuthUnknownException(e);
    });
  }

  @override
  Future<User> session() {
    final uid = _auth.currentUser?.uid;
    return uid != null
        ? SynchronousFuture(AuthenticatedUser(uid))
        : SynchronousFuture(UnauthenticatedUser());
  }
}

extension on AuthClientImpl {
  Future<User> signInWithFirebase(String otp) async {
    final target = AuthTarget.signIn(otp);
    final signInResponse = await _api.request(target, SignInResponse.fromMap);
    final customToken = signInResponse.customToken;
    final userCredential = await _auth.signInWithCustomToken(customToken);
    return AuthenticatedUser(userCredential.user!.uid);
  }
}
