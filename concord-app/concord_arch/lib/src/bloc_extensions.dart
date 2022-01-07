import 'package:concord_arch/concord_arch.dart';

extension EmitterX<State> on Emitter<State> {
  Future<void> eachState(Stream<State> stream) {
    return onEach(stream, onData: call);
  }
}
