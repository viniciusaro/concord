import 'dart:convert';

import 'package:concord_foundation/concord_foundation.dart';

import 'package:firebase_auth/firebase_auth.dart' hide User;
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
  Future<User> signIn(String token) {
    return signInWithFirebase(token).mapError((e) {
      return e is FirebaseAuthException
          ? AuthProviderError(e)
          : AuthUnknownError(e);
    });
  }

  @override
  Future<User> signOut() {
    return _auth.signOut().map((_) => UnauthenticatedUser()).mapError((e) {
      return e is FirebaseAuthException
          ? AuthProviderError(e)
          : AuthUnknownError(e);
    });
  }

  @override
  Future<User> session() {
    return _auth.currentUser
            ?.getIdToken()
            .map((token) => AuthenticatedUser(token.userId)) ??
        SynchronousFuture(UnauthenticatedUser());
  }

  @override
  Future<String?> userIdOrNull() {
    return _auth.currentUser?.getIdToken().map((token) => token.userId) ??
        SynchronousFuture(null);
  }
}

extension on AuthClientImpl {
  Future<User> signInWithFirebase(String token) async {
    final target = AuthTarget.signIn(token);
    final signInResponse = await _api.request(target, SignInResponse.fromMap);
    final customToken = signInResponse.customToken;
    final userCredential = await _auth.signInWithCustomToken(customToken);
    return AuthenticatedUser(userCredential.user!.uid);
  }
}

extension on String {
  String get userId {
    final payload = _parsePayloadFromAccessToken();
    return payload['user_id'] as String;
  }

  Map<String, dynamic> _parsePayloadFromAccessToken() {
    final parts = split('.');
    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    return jsonDecode(utf8.decode(base64Url.decode(normalized)))
        as Map<String, dynamic>;
  }
}
