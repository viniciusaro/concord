import 'dart:async';

import 'package:concord_foundation/di.dart';
import 'package:concord_foundation/exceptions.dart';
import 'package:concord_ui/global.dart';
import 'package:get_it/get_it.dart';

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
    if (error.reportIfUnhandledDeep) {
      parent.handleUncaughtError(zone, error, stackTrace);
    }
  } else {
    parent.handleUncaughtError(zone, error, stackTrace);
  }
}
