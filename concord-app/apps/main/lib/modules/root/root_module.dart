import 'package:chat/chat.dart';
import 'package:concord_core/concord_core.dart';
import 'package:login/login.dart';

import 'root_provider.dart';

class RootModule {
  final AuthClient _authClient;

  final ChatListModule _chatListModule;
  final LoginModule _loginModule;

  RootModule(
    this._authClient,
    this._chatListModule,
    this._loginModule,
  );

  RootProvider build({required User user}) {
    return RootProvider(
      user: user,
      authClient: _authClient,
      chatListModule: _chatListModule,
      loginModule: _loginModule,
    );
  }
}
