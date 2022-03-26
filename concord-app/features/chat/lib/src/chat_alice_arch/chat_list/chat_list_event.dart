abstract class ChatListEvent {}

class ChatListEventStart implements ChatListEvent {}

class ChatListEventItemTap implements ChatListEvent {
  final int index;
  ChatListEventItemTap(this.index);
}
