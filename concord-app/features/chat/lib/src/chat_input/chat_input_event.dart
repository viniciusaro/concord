abstract class ChatInputEvent {}

class ChatInputEventStart implements ChatInputEvent {}

class ChatInputEventSend implements ChatInputEvent {
  final String text;
  ChatInputEventSend(this.text);
}
