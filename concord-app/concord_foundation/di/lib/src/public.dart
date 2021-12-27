typedef Getter = T Function<T extends Object>();
typedef Setter = void Function<T extends Object>(T Function() factory);

class DependencyContainer {
  final Getter getter;
  final Setter setter;
  DependencyContainer(this.getter, this.setter);
}

mixin Register {
  void register(Getter get, Setter set);
}

mixin RootLoader<T> {
  Future<T> load(Getter get, Setter set);
}

Future<bool> load<T>(
  DependencyContainer container,
  RootLoader<T> rootRegister,
  List<Register> Function(T) registersBuilder,
) async {
  final registers = registersBuilder(await rootRegister.load(
    container.getter,
    container.setter,
  ));

  for (final register in registers) {
    register.register(container.getter, container.setter);
  }

  return true;
}
