typedef Getter = T Function<T extends Object>();
typedef Setter = void Function<T extends Object>(T Function() factory);
typedef SingletonSetter = void Function<T extends Object>(T Function() factory);

class ServiceLocator {
  final Getter get;
  final Setter set;
  final SingletonSetter setSingleton;
  const ServiceLocator(this.get, this.set, this.setSingleton);
}
