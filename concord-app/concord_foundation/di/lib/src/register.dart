import 'service_locator.dart';

mixin Register {
  void register(
    Getter get,
    Setter set,
    SingletonSetter setSingleton,
  );
}
