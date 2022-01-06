import 'base_error.dart';

abstract class ModelError<T> extends BaseError {
  @override
  bool get reportIfUnhandled => true;

  @override
  final Object? error;
  ModelError({this.error});
}

class SerializationError<T> extends ModelError<T> {
  final T value;

  SerializationError(this.value, Object error) : super(error: error);

  @override
  String? get message => "Error trying to serialize value: $T into data";
}

class DeserializationError<T> extends ModelError<T> {
  final String data;

  DeserializationError(this.data, Object error) : super(error: error);

  @override
  String? get message => "Error trying to deserialize $T from data: $data";
}
