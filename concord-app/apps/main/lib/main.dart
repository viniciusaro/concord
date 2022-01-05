import 'dart:async';

import 'package:chat/chat.dart';
import 'package:concord_core/auth.dart';
import 'package:concord_core/networking.dart';
import 'package:concord_core/realtime.dart';
import 'package:concord_core/storage.dart';
import 'package:concord_foundation/di.dart';
import 'package:concord_ui/global.dart';
import 'package:get_it/get_it.dart';
import 'package:login/login.dart';

import 'main_definitions.dart';
import 'main_loader.dart';
import 'main_register.dart';
import 'splash.dart';

void loadAndRun() {
  final serviceLocator = ServiceLocator(
    GetIt.instance.get,
    GetIt.instance.registerFactory,
  );

  runApp(ConcordApp(
    loadingBuilder: loadingBuilder,
    theme: theme,
    child: Splash(
      applicationLoader: () => load(
        rootLoader: MainLoader(),
        serviceLocator: serviceLocator,
        registersBuilder: (result) => [
          MainRegister(result.user),
          AuthRegister(),
          NetworkingRegister(),
          LoginRegister(),
          ChatRegister(),
          RealtimeDatabaseRegister(),
          StorageRegister(result.mainBox),
        ],
      ),
      applicationBuilder: (_) => serviceLocator.get<Widget>(),
    ),
  ));
}

void main() {
  runZonedGuarded(
    () {
      loadAndRun();
    },
    (e, s) {
      // print("error! $e");
    },
    zoneSpecification: const ZoneSpecification(
      handleUncaughtError: filteredHandleUncaughtError,
    ),
  );
}
