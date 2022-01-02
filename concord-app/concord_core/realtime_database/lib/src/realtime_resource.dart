import 'package:concord_foundation/serialization.dart';

abstract class RealtimeResource {
  Stream<List<T>> documents<T>(Deserializer<T> deserializer);
}

abstract class IdentifiableRealtimeResource<Id> {
  Stream<List<T>> documents<T>(Id identifier, Deserializer<T> deserializer);
  Future<void> write<T>(Id identifier, T document, Serializer<T> serializer);
}

abstract class ChatRealtimeResource
    extends IdentifiableRealtimeResource<String> {}

abstract class ChatCollectionRealtimeResource extends RealtimeResource {}
