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

register(DependencyContainer container, List<Register> registers) {
  for (final register in registers) {
    register.register(
      container.getter,
      container.setter,
    );
  }
}
