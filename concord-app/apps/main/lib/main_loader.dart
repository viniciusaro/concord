import 'package:concord_foundation/concord_foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoadResult {
  final Box<Map<String, dynamic>> mainBox;
  LoadResult(this.mainBox);
}

class MainLoader with RootLoader<LoadResult> {
  @override
  Future<LoadResult> load(Getter get, Setter set) async {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    await Future.delayed(const Duration(seconds: 5));

    final mainBox = await Hive.openBox<Map<String, dynamic>>("main");
    return LoadResult(mainBox);
  }
}
