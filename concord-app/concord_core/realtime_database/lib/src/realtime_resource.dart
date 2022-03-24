import 'package:concord_foundation/serialization.dart';

///
abstract class RealtimeResource {
  Stream<List<T>> documents<T>(Deserializer<T> deserializer);
}

abstract class ChatListRealtimeResource extends RealtimeResource {}

///
abstract class WritableRealtimeResource<Id> {
  Stream<List<T>> documents<T>(Id identifier, Deserializer<T> deserializer);
  Future<void> write<T>(Id identifier, T document, Serializer<T> serializer);
}

abstract class ChatMessageRealtimeResource
    extends WritableRealtimeResource<String> {}
