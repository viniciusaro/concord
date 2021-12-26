import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Container;
import 'package:get_it/get_it.dart';

import 'package:auth/auth.dart';
import 'package:concord_foundation/concord_foundation.dart';
import 'package:concord_ui/concord_ui.dart';
import 'package:login/login.dart';

import 'main_register.dart';

Future<void> main() async {
  await Firebase.initializeApp();

  final container = DependencyContainer(
    GetIt.instance.get,
    GetIt.instance.registerFactory,
  );

  final register = AggregateRegister(container, [
    MainRegister(),
    AuthRegister(),
  ]);

  final homeModule = container.getter<LoginModule>();
  final home = homeModule.build();

  runApp(ConcordApp(register: register, child: home));
}
