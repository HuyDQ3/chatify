part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();
}

class SendMessageInputBar extends MessageEvent {
  final ChatifySendMessage? message;

  const SendMessageInputBar({this.message});

  @override
  List<Object?> get props => [message];
}
