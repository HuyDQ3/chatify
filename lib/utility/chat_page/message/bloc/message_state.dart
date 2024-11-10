part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  const MessageState();
}

final class MessageInitial extends MessageState {
  @override
  List<Object> get props => [];
}

final class MessageLoadInProgress extends MessageState {
  @override
  List<Object?> get props => [];
}

final class MessageLoadSuccess extends MessageState {
  final List<Message> messages;

  const MessageLoadSuccess(this.messages);

  @override
  List<Object?> get props => [messages];
}

final class MessageLoadFailure extends MessageState {
  @override
  List<Object?> get props => [];
}

final class MessageSendInProgress extends MessageState {
  const MessageSendInProgress();

  @override
  List<Object?> get props => [];
}

final class MessageSendSuccess extends MessageState {
  const MessageSendSuccess();

  @override
  List<Object?> get props => [];
}

final class MessageSendFailure extends MessageState {
  const MessageSendFailure();

  @override
  List<Object?> get props => [];
}

final class MessageReceiveInProgress extends MessageState {
  const MessageReceiveInProgress();

  @override
  List<Object?> get props => [];
}

final class MessageReceiveSuccess extends MessageState {
  final List<Message> messages;

  const MessageReceiveSuccess(this.messages);

  @override
  List<Object?> get props => [messages];
}

final class MessageReceiveFailure extends MessageState {
  const MessageReceiveFailure();

  @override
  List<Object?> get props => [];
}
