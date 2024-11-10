part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();
}

class MessageStarted extends MessageEvent {
  @override
  List<Object?> get props => [];
}

class MessageSent extends MessageEvent {
  final String senderId;
  final String conversationId;
  final MessageContent content;

  const MessageSent({required this.senderId, required this.conversationId, required this.content,});

  @override
  List<Object?> get props => [senderId, conversationId, content];
}

class MessageReceived extends MessageEvent {
  const MessageReceived();

  @override
  List<Object?> get props => [];
}
