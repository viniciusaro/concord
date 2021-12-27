import 'package:concord_foundation/concord_foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:networking/networking.dart';
import 'package:shared_models/shared_models.dart';

import 'auth_client.dart';
import 'auth_target.dart';
import 'sign_in_response.dart';

class AuthClientImpl implements AuthClient {
  final ApiClient _api;
  final FirebaseAuth _auth;

  AuthClientImpl(this._api, this._auth);

  @override
  Future<AuthenticatedUser> signIn(String token) {
    return signInWithFirebase(token).mapError((e) {
      return e is FirebaseAuthException
          ? AuthProviderError(e)
          : AuthUnknownError(e);
    });
  }

  Future<AuthenticatedUser> signInWithFirebase(String token) async {
    final target = AuthTarget.signIn(token);
    final signInResponse = await _api.request(target, SignInResponse.fromMap);
    final customToken = signInResponse.customToken;
    final userCredential = await _auth.signInWithCustomToken(customToken);
    return AuthenticatedUser(userCredential.user!.uid);
  }
}
