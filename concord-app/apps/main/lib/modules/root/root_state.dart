import 'package:concord_core/shared_models.dart';
import 'package:concord_foundation/serialization.dart';

part 'root_state.freezed.dart';

@freezed
class RootState with _$RootState {
  RootState._();

  factory RootState({
    required User user,
    @Default(false) bool loading,
    @Default(null) Object? error,
  }) = _RootState;

  bool get isLoggedIn => user is AuthenticatedUser;
}
