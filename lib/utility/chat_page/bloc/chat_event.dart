part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

// chat
class ChatCrawled extends ChatEvent {
  final User? user;

  const ChatCrawled(this.user);

  @override
  List<Object?> get props => [user];
}
//

// cuoc tro chuyen
class ChatConversationCrawled extends ChatEvent {
  final User? user;

  const ChatConversationCrawled(this.user);

  @override
  List<Object?> get props => [user];
}

class ChatConversationPushToMessagePage extends ChatEvent {
  final Conversation conversation;

  const ChatConversationPushToMessagePage(this.conversation);

  @override
  List<Object?> get props => [conversation];
}
//

// tin nhan
class ChatMessageCrawled extends ChatEvent {
  final Conversation conversation;

  const ChatMessageCrawled(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ChatMessageSent extends ChatEvent {
  final Messenger messenger;

  const ChatMessageSent(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class ChatMessageReceived extends ChatEvent {
  final Messenger messenger;

  const ChatMessageReceived(this.messenger);

  @override
  List<Object?> get props => [messenger];
}
