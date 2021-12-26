import 'package:auth/src/auth_target.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:networking/networking.dart';
import 'package:shared_models/shared_models.dart';

import 'auth_client.dart';

class AuthClientImpl implements AuthClient {
  final ApiClient _api;
  final FirebaseAuth _auth;

  AuthClientImpl(this._api, this._auth);

  @override
  Future<AuthenticatedUser> signIn(String token) async {
    final target = AuthTarget.signIn(token);
    final signInResponse = await _api.request(target, SignInResponse.fromMap);
    final customToken = signInResponse.customToken;
    final userCredential = await _auth.signInWithCustomToken(customToken);
    return AuthenticatedUser(userCredential.user!.uid);
  }
}

class SignInResponse {
  final String customToken;
  SignInResponse(this.customToken);

  static SignInResponse fromMap(Map<String, dynamic> map) {
    return SignInResponse(
      map['custom_token'] as String? ?? '',
    );
  }
}
