import 'dart:async';

import 'package:concord_arch/concord_arch.dart';
import 'package:concord_foundation/types.dart';
import 'package:login_data/login_data.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginState()) {
    on<LoginEventSignIn>((event, emit) async {
      emit(state.copyWith(submitting: true));

      try {
        await _loginRepository.sendOtp(event.alias);
        emit(state.copyWith(success: TransientValue(true)));
      } catch (e) {
        emit(state.copyWith(error: e));
        rethrow;
      } finally {
        emit(state.copyWith(submitting: false));
      }
    });
  }
}

extension FutureX<T> on Future<T> {
  Future<void> tryFuture({
    required Function(T) onSuccess,
    required Function(Object?, StackTrace) onError,
    Function()? always,
  }) {
    return then(onSuccess).onError((error, stackTrace) {
      onError(error, stackTrace);
      if (error != null) throw error;
    }).whenComplete(() => always?.call());
  }

  Future<T> onErrorReport() async {
    try {
      return await this;
    } catch (e, s) {
      final zone = Zone.current;
      zone.handleUncaughtError(e, s);
      rethrow;
    }
  }
}
