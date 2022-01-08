import 'package:di/di.dart';
import 'package:get_it/get_it.dart';

final playgroundLocator = ServiceLocator(
  GetIt.instance.get,
  GetIt.instance.registerFactory,
  GetIt.instance.registerLazySingleton,
);
