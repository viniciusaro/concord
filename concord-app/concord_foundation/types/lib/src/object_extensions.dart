extension ObjectX<T> on T {
  U? let<U>(U Function(T) compute) {
    if (this == null) {
      return null;
    }
    return compute(this);
  }
}
