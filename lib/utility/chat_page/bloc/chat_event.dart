part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

class ChatMessageSent extends ChatEvent {
  final Message message;

  const ChatMessageSent(this.message);

  @override
  List<Object?> get props => [message];
}