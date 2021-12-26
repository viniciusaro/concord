import 'package:networking/networking.dart';

class AuthTarget with Target {
  AuthTarget(this.method, this.parameters, this.path);

  @override
  String get baseUrl => "http://localhost:8080";

  @override
  String get contentType => "application/json";

  @override
  Map<String, String> get headers => {};

  @override
  final HttpMethod method;

  @override
  final dynamic parameters;

  @override
  final String path;

  static AuthTarget signIn(String token) {
    return AuthTarget(
      HttpMethod.post,
      {"token": token},
      "/sign_in",
    );
  }
}
