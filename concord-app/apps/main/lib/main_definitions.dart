part of 'main.dart';

Widget loadingBuilder(BuildContext context) {
  return const ConcordLoading();
}

ConcordTokens get theme {
  return defaultConcordTheme;
}

void filteredHandleUncaughtError(
  Zone self,
  ZoneDelegate parent,
  Zone zone,
  Object error,
  StackTrace stackTrace,
) {
  if (error is BaseError) {
    if (error.reportIfUnhandled) {
      parent.handleUncaughtError(zone, error, stackTrace);
    }
  } else {
    parent.handleUncaughtError(zone, error, stackTrace);
  }
}
