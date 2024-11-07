part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

// lay ca tin nhan va cuoc tro chuyen
class ChatLoadInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadInProgress extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadSuccess extends ChatState {
  final Map<Conversation, List<Messenger>> chat;

  const ChatLoadSuccess(this.chat);

  @override
  List<Object?> get props => [chat];
}

class ChatLoadFailure extends ChatState {
  @override
  List<Object?> get props => [];
}
//

// cuoc tro chuyen
class ConversationLoadInitial extends ChatState {
  final Conversation conversation;

  const ConversationLoadInitial(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ConversationLoadInProgress extends ChatState {
  final Conversation conversation;

  const ConversationLoadInProgress(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ConversationLoadSuccess extends ChatState {
  final Conversation conversation;

  const ConversationLoadSuccess(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ConversationLoadFailure extends ChatState {
  final Conversation conversation;

  const ConversationLoadFailure(this.conversation);

  @override
  List<Object?> get props => [conversation];
}
//

// tin nhan
class MessengerLoadInitial extends ChatState {
  final List<Messenger> messengers;

  const MessengerLoadInitial(this.messengers);

  @override
  List<Object?> get props => [messengers];
}

class MessengerLoadInProgress extends ChatState {
  final List<Messenger> messengers;

  const MessengerLoadInProgress(this.messengers);

  @override
  List<Object?> get props => [messengers];
}

class MessengerLoadSuccess extends ChatState {
  final List<Messenger> messengers;

  const MessengerLoadSuccess(this.messengers);

  @override
  List<Object?> get props => [messengers];
}

class MessengerLoadFailure extends ChatState {
  final List<Messenger> messengers;

  const MessengerLoadFailure(this.messengers);

  @override
  List<Object?> get props => [messengers];
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
