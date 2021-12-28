import 'package:concord_core/concord_core.dart';

import 'chat_message.dart';

part 'chat_collection.freezed.dart';
part 'chat_collection.g.dart';

@freezed
class ChatCollection with _$ChatCollection {
  factory ChatCollection(List<ChatMessage> messages) = _ChatCollection;

  factory ChatCollection.fromJson(Map<String, dynamic> json) =>
      _$ChatCollectionFromJson(json);

  static ChatCollection fromMap(Map<String, dynamic> json) {
    return _$ChatCollectionFromJson(json);
  }
}
