import 'package:chat/chat.dart';
import 'package:concord_core/shared_models.dart';
import 'package:login/data.dart';
import 'package:login/login.dart';

import 'root_provider.dart';

class RootModule {
  final LoginRepository _loginRepository;

  final ChatListModule _chatListModule;
  final LoginModule _loginModule;

  RootModule(
    this._loginRepository,
    this._chatListModule,
    this._loginModule,
  );

  RootProvider build({required User user}) {
    return RootProvider(
      user: user,
      loginRepository: _loginRepository,
      chatListModule: _chatListModule,
      loginModule: _loginModule,
    );
  }
}
