import 'dart:async';

import 'package:get_it/get_it.dart';

import 'package:concord_core/concord_core.dart';
import 'package:concord_ui/concord_ui.dart';
import 'package:login/login.dart';

import 'main_error.dart';
import 'main_loader.dart';
import 'splash.dart';

void loadAndRun() {
  final container = DependencyContainer(
    GetIt.instance.get,
    GetIt.instance.registerFactory,
  );

  runApp(Splash(
    loader: () => load(
      container,
      MainLoader(),
      (LoadResult result) => [
        AuthRegister(),
        NetworkingRegister(),
        LoginRegister(),
        StorageRegister(result.mainBox),
      ],
    ),
    builder: () => container.getter<LoginModule>().build(),
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
