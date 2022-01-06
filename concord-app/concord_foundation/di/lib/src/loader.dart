import 'register.dart';
import 'service_locator.dart';

mixin RootLoader<T> {
  Future<T> load();
}

Future<T> load<T>({
  required RootLoader<T> rootLoader,
  required ServiceLocator serviceLocator,
  required List<Register> Function(T) registersBuilder,
}) async {
  final result = await rootLoader.load();
  final registers = registersBuilder(result);

  for (final register in registers) {
    register.register(
      serviceLocator.get,
      serviceLocator.set,
      serviceLocator.setSingleton,
    );
  }

  return result;
}
