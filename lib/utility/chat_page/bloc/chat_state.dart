part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

// chat
class ChatLoadInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadInProgress extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadSuccess extends ChatState {
  final List<Conversation> conversations;

  const ChatLoadSuccess(this.conversations);

  @override
  List<Object?> get props => [conversations];
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
  final Messenger messenger;

  const MessengerLoadInitial(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerLoadInProgress extends ChatState {
  final Messenger messenger;

  const MessengerLoadInProgress(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerLoadSuccess extends ChatState {
  final Messenger messenger;

  const MessengerLoadSuccess(this.messenger);

  @override
  List<Object?> get props => [messenger];
}

class MessengerLoadFailure extends ChatState {
  final Messenger messenger;

  const MessengerLoadFailure(this.messenger);

  @override
  List<Object?> get props => [messenger];
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
