part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

// lay tat ca chat
class ChatCrawled extends ChatEvent {
  final User? user;

  const ChatCrawled(this.user);

  @override
  List<Object?> get props => [user];
}

// chi lay cuoc tro chuyen
class ChatConversationCrawled extends ChatEvent {
  final User? user;

  const ChatConversationCrawled(this.user);

  @override
  List<Object?> get props => [user];
}

// chi lay tin nhan
class ChatMessageCrawled extends ChatEvent {
  final User? user;

  const ChatMessageCrawled(this.user);

  @override
  List<Object?> get props => [user];
}

class ChatConversationTapped extends ChatEvent {
  final Conversation conversation;

  const ChatConversationTapped(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ChatMessageSent extends ChatEvent {
  final Messenger messenger;

  const ChatMessageSent(this.messenger);

  @override
  List<Object?> get props => [messenger];
}
