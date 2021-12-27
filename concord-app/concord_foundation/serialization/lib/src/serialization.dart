typedef Serializer<T> = Map<String, dynamic> Function(T);
typedef Deserializer<T> = T Function(Map<String, dynamic>);
