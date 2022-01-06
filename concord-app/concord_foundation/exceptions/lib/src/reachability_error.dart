import 'base_error.dart';

abstract class ReachabilityError<T> extends BaseError {
  @override
  bool get reportIfUnhandled => true;
}

class NoConnectionError<T> extends ReachabilityError<T> {}
