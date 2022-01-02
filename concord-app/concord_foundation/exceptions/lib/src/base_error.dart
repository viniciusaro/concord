abstract class BaseError implements Exception {
  int? get code => null;
  String? get message => null;
  bool get reportIfUnhandled => false;
  Object? get error => null;

  @override
  String toString() {
    return """
    ${runtimeType.toString()} 
    ${code != null ? 'code: $code' : ''} 
    ${message != null ? 'message: $message' : ''}
    ${error != null ? 'error: $error' : ''}
    """;
  }
}
