part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

// lay ca tin nhan va cuoc tro chuyen
class ChatCrawlInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatCrawlInProgress extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatCrawlSuccess extends ChatState {
  final Map<Conversation, List<Messenger>> chat;

  const ChatCrawlSuccess(this.chat);

  @override
  List<Object?> get props => [chat];
}

class ChatCrawlFailure extends ChatState {
  @override
  List<Object?> get props => [];
}
//

// cuoc tro chuyen
class ConversationCrawlInitial extends ChatState {
  const ConversationCrawlInitial();

  @override
  List<Object?> get props => [];
}

class ConversationCrawlInProgress extends ChatState {
  const ConversationCrawlInProgress();

  @override
  List<Object?> get props => [];
}

class ConversationCrawlSuccess extends ChatState {
  final List<Conversation> conversations;

  const ConversationCrawlSuccess(this.conversations);

  @override
  List<Object?> get props => [conversations];
}

class ConversationCrawlFailure extends ChatState {
  const ConversationCrawlFailure();

  @override
  List<Object?> get props => [];
}
//

// tin nhan
class MessengerCrawlInitial extends ChatState {
  const MessengerCrawlInitial();

  @override
  List<Object?> get props => [];
}

class MessengerCrawlInProgress extends ChatState {
  const MessengerCrawlInProgress();

  @override
  List<Object?> get props => [];
}

class MessengerCrawlSuccess extends ChatState {
  final List<Messenger> messengers;

  const MessengerCrawlSuccess(this.messengers);

  @override
  List<Object?> get props => [messengers];
}

class MessengerCrawlFailure extends ChatState {
  const MessengerCrawlFailure();

  @override
  List<Object?> get props => [];
}
//

// trang thai tin nhan cua nguoi gui
class MessengerSendInitial extends ChatState {
  final Messenger messenger;

  const MessengerSendInitial(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerSendInProgress extends ChatState {
  final Messenger messenger;

  const MessengerSendInProgress(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerSendSuccess extends ChatState {
  final Messenger messenger;

  const MessengerSendSuccess(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerSendFailure extends ChatState {
  final Messenger messenger;

  const MessengerSendFailure(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

// trang thai tin nhan cua nguoi nhan
class MessengerReceiveInitial extends ChatState {
  final Messenger messenger;

  const MessengerReceiveInitial(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerReceiveInProgress extends ChatState {
  final Messenger messenger;

  const MessengerReceiveInProgress(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerReceiveSuccess extends ChatState {
  final Messenger messenger;

  const MessengerReceiveSuccess(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerReceiveFailure extends ChatState {
  final Messenger messenger;

  const MessengerReceiveFailure(this.messenger);

  @override
  List<Object?> get props => [messenger];
}
//
