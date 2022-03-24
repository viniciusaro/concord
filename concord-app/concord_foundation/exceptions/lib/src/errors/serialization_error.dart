import '../base_error.dart';

class SerializationError<T> extends BaseError {
  final T value;

  @override
  String? get message => "error trying to serialize value: $T into data";

  SerializationError(this.value, Object error) : super(error);
}

class DeserializationError<T> extends BaseError {
  final String data;

  @override
  String? get message => "error trying to deserialize $T from data: $data";

  DeserializationError(this.data, Object error) : super(error);
}
