import 'base_error.dart';

extension ReportableError on BaseError {
  bool get reportIfUnhandledDeep =>
      reportIfUnhandled || (_errorAsBaseError?.reportIfUnhandledDeep ?? false);

  BaseError? get _errorAsBaseError => error as BaseError;
}
