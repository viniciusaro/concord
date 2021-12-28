import 'package:chat/chat.dart';
import 'package:concord_core/concord_core.dart';
import 'package:login/login.dart';

import 'root_provider.dart';

class RootModule {
  final AuthClient _authClient;

  final ChatModule _chatModule;
  final LoginModule _loginModule;

  RootModule(
    this._authClient,
    this._chatModule,
    this._loginModule,
  );

  RootProvider build({required User user}) {
    return RootProvider(
      user: user,
      authClient: _authClient,
      chatModule: _chatModule,
      loginModule: _loginModule,
    );
  }
}
