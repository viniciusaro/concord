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
  Future<T> load();
}

Future<T> load<T>(
  DependencyContainer container,
  RootLoader<T> rootRegister,
  List<Register> Function(T) registersBuilder,
) async {
  final result = await rootRegister.load();
  final registers = registersBuilder(result);

  for (final register in registers) {
    register.register(container.getter, container.setter);
  }

  return result;
}
