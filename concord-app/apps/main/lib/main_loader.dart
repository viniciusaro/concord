import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/di.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _sentryDsn =
    "https://1bc9153615994894b96c546791b38bcb@o1111186.ingest.sentry.io/6140289";

class ApplicationLoadResult {
  final User user;
  final Box<Map<String, dynamic>> mainBox;
  ApplicationLoadResult(this.user, this.mainBox);
}

class MainLoader with RootLoader<ApplicationLoadResult> {
  @override
  Future<ApplicationLoadResult> load() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    await SentryFlutter.init((options) {
      options.dsn = _sentryDsn;
      options.reportSilentFlutterErrors = true;
      options.tracesSampleRate = 1.0;
    });

    final user = loadUser();
    final mainBox = await openBox();
    return ApplicationLoadResult(user, mainBox);
  }

  User loadUser() {
    final uid = auth.FirebaseAuth.instance.currentUser?.uid;
    return uid != null ? AuthenticatedUser(uid) : UnauthenticatedUser();
  }

  Future<Box<Map<String, dynamic>>> openBox() {
    return Hive.openBox<Map<String, dynamic>>("main");
  }
}
