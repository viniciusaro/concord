import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/di.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoadResult {
  final User user;
  final Box<Map<String, dynamic>> mainBox;
  LoadResult(this.user, this.mainBox);
}

class MainLoader with RootLoader<LoadResult> {
  @override
  Future<LoadResult> load() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();

    final user = loadUser();
    final mainBox = await openBox();
    return LoadResult(user, mainBox);
  }
}

extension on MainLoader {
  User loadUser() {
    final uid = auth.FirebaseAuth.instance.currentUser?.uid;
    return uid != null ? AuthenticatedUser(uid) : UnauthenticatedUser();
  }

  Future<Box<Map<String, dynamic>>> openBox() {
    return Hive.openBox<Map<String, dynamic>>("main");
  }
}
