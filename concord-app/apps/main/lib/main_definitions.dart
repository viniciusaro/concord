import 'dart:async';

import 'package:concord_foundation/di.dart';
import 'package:concord_foundation/exceptions.dart';
import 'package:concord_ui/global.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

///
final serviceLocator = ServiceLocator(
  GetIt.instance.get,
  GetIt.instance.registerFactory,
  GetIt.instance.registerLazySingleton,
);

///
Widget loadingBuilder(BuildContext context) => const ConcordLoading();

///
final theme = defaultConcordTheme;

///
void filteredHandleUncaughtError(
  Zone self,
  ZoneDelegate parent,
  Zone zone,
  Object error,
  StackTrace stackTrace,
) {
  if (error is BaseError) {
    reportError(error, error.extrasDeep, stackTrace, handled: false);
  } else if (error is BaseException) {
    reportError(error, error.extrasDeep, stackTrace, handled: true);
  } else {
    reportError(error, null, stackTrace, handled: false);
  }
  parent.handleUncaughtError(zone, error, stackTrace);
}

///
void reportError(
  Object error,
  Extras? extras,
  StackTrace? stackTrace, {
  required bool handled,
}) {
  final formattedTrace = Trace.parse(stackTrace?.toString() ?? "").foldFrames(
    (frame) => frame.package?.contains("flutter") == true,
    terse: true,
  );

  final level = handled ? SentryLevel.warning : SentryLevel.error;

  Sentry.captureEvent(
    SentryEvent(
      level: level,
      extra: extras,
      throwable: ThrowableMechanism(
        Mechanism(type: "concord_mechanism", handled: handled),
        error,
      ),
    ),
    stackTrace: formattedTrace,
  );
}
