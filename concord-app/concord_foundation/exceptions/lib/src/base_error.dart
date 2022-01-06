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

extension ReportableError on BaseError {
  bool get reportIfUnhandledDeep =>
      reportIfUnhandled || (_errorAsBaseError?.reportIfUnhandledDeep ?? false);

  BaseError? get _errorAsBaseError =>
      error is BaseError ? error as BaseError : null;
}
