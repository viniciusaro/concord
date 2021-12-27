import 'base_error.dart';

abstract class ModelError<T> extends BaseError {
  @override
  bool get reportIfUnhandled => true;
}

class SerializationError<T> extends ModelError<T> {
  final T value;

  SerializationError(this.value);

  @override
  String? get message => "Error trying to serialize value: $T into data";
}

class DeserializationError<T> extends ModelError<T> {
  final String data;

  DeserializationError(this.data);

  @override
  String? get message => "Error trying to deserialize $T from data: $data";
}
