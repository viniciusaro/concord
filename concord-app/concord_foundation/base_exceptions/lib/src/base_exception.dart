abstract class BaseException implements Exception {
  int? get code => null;
  String? get message => null;

  @override
  String toString() {
    return "${runtimeType.toString()} ${code != null ? 'code: $code' : ''} ${message != null ? 'message: $message' : ''}";
  }
}
