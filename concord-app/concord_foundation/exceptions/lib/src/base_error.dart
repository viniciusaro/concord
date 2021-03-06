import 'base_helpers.dart';

abstract class BaseError extends Error {
  final Object origin;
  final String? message;
  final Extras? extras;

  BaseError(this.origin, {this.extras = const {}, this.message});

  Extras? get extrasDeep {
    return {
      ...extras ?? {},
      ...origin is BaseError ? (origin as BaseError).extras ?? {} : {},
    };
  }

  @override
  String toString() {
    return "${runtimeType.toString()}${message != null ? "\nmessage: $message" : ""}\norigin: $origin}";
  }
}
