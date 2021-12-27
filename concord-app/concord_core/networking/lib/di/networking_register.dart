import 'package:concord_foundation/concord_foundation.dart';
import 'package:networking/networking.dart';
import 'package:networking/src/api_client_impl.dart';

class NetworkingRegister with Register {
  @override
  void register(Getter get, Setter set) {
    set(() => Dio());
    set(() => ApiClientImpl(get()) as ApiClient);
  }
}
