import 'package:networking/src/http_method.dart';

abstract class Target {
  String get contentType;
  Map<String, String> get headers;
  String get path;
  String get baseUrl;
  dynamic get parameters;
  HttpMethod get method;
}
