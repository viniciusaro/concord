import 'base_helpers.dart';

abstract class BaseException implements Exception {
  final Object origin;
  final String? message;
  final Extras? extras;

  BaseException(this.origin, {this.extras = const {}, this.message});

  Extras? get extrasDeep {
    return {
      ...extras ?? {},
      ...origin is BaseException ? (origin as BaseException).extras ?? {} : {},
    };
  }

  @override
  String toString() {
    return "${runtimeType.toString()}${message != null ? "\nmessage: $message" : ""}\norigin: $origin}";
  }
}
