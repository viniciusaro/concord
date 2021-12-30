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

  static AuthTarget sendOtp(String alias) {
    return AuthTarget(
      HttpMethod.post,
      {"alias": alias},
      "/send_otp",
    );
  }

  static AuthTarget signIn(String otp) {
    return AuthTarget(
      HttpMethod.post,
      {"otp": otp},
      "/sign_in",
    );
  }
}
