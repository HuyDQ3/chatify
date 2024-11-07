part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

class ChatConversationsAndMessagesCrawled extends ChatEvent {
  final User? user;

  const ChatConversationsAndMessagesCrawled(this.user);

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
