import 'package:concord_foundation/serialization.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  factory SignInResponse(String customToken) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  static SignInResponse fromMap(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}
