import 'package:concord_foundation/serialization.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  factory Chat(String id, String userId, String guestId) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  static Chat fromMap(Map<String, dynamic> json) => _$ChatFromJson(json);
}
