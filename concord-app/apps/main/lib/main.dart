import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Container;
import 'package:get_it/get_it.dart';

import 'package:concord_foundation/concord_foundation.dart';
import 'package:concord_core/concord_core.dart';
import 'package:concord_ui/concord_ui.dart';
import 'package:login/login.dart';

import 'main_register.dart';

part 'main_init.dart';

Future<void> main() async {
  await initialize();

  final container = DependencyContainer(
    GetIt.instance.get,
    GetIt.instance.registerFactory,
  );

  register(container, [
    MainRegister(),
    AuthRegister(),
    NetworkingRegister(),
    LoginRegister(),
  ]);

  final homeModule = container.getter<LoginModule>();
  final home = homeModule.build();

  runApp(ConcordApp(child: home));
}
