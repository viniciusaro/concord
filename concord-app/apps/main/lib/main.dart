import 'dart:async';

import 'package:chat/chat.dart';
import 'package:concord_core/auth.dart';
import 'package:concord_core/networking.dart';
import 'package:concord_core/realtime.dart';
import 'package:concord_core/storage.dart';
import 'package:concord_foundation/di.dart';
import 'package:concord_foundation/exceptions.dart';
import 'package:concord_ui/global.dart';
import 'package:login/login.dart';

import 'main_definitions.dart';
import 'main_loader.dart';
import 'main_register.dart';
import 'splash.dart';

void loadAndRun() {
  runApp(ConcordApp<ApplicationLoadResult>(
    splash: const Splash(),
    loadingBuilder: loadingBuilder,
    theme: theme,
    applicationLoader: () => load(
      rootLoader: MainLoader(),
      serviceLocator: serviceLocator,
      registersBuilder: (result) => [
        // application
        MainRegister(result.user),
        // core libraries
        AuthRegister(),
        NetworkingRegister(),
        RealtimeDatabaseRegister(),
        StorageRegister(result.mainBox),
        // features
        ChatRegister(),
        LoginRegister(),
      ],
    ),
    loadedApplicationBuilder: (_) => serviceLocator.get<ApplicationRoot>(),
  ));
}

void main() {
  FlutterError.onError = (details) {
    final error = FrameworkError(details.exception);
    reportError(error, null, details.stack, handled: false);
  };

  runZoned(
    () => Chain.capture(() => loadAndRun()),
    zoneSpecification: const ZoneSpecification(
      handleUncaughtError: filteredHandleUncaughtError,
    ),
  );
}
