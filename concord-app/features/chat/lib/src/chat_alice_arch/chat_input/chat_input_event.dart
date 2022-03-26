abstract class ChatInputEvent {}

class ChatInputEventSend implements ChatInputEvent {
  final String text;
  ChatInputEventSend(this.text);
}
