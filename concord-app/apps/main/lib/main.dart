import 'dart:async';

import 'package:chat/chat.dart';
import 'package:get_it/get_it.dart';

import 'package:concord_core/concord_core.dart';
import 'package:concord_ui/concord_ui.dart';
import 'package:login/login.dart';

import 'main_register.dart';
import 'main_loader.dart';
import 'splash.dart';

part 'main_definitions.dart';

void loadAndRun() {
  final container = DependencyContainer(
    GetIt.instance.get,
    GetIt.instance.registerFactory,
  );

  runApp(ConcordApp(
    loadingBuilder: loadingBuilder,
    theme: theme,
    child: Splash(
      loader: () => load(
        container,
        MainLoader(),
        (result) => [
          MainRegister(result.user),
          AuthRegister(),
          NetworkingRegister(),
          LoginRegister(),
          ChatRegister(),
          StorageRegister(result.mainBox),
        ],
      ),
      builder: (_) => container.getter<Widget>(),
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
