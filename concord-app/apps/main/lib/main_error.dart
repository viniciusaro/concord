import 'dart:async';

import 'package:concord_foundation/concord_foundation.dart';

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
