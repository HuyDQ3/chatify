part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  const MessageState();
}

final class MessageInitial extends MessageState {
  @override
  List<Object> get props => [];
}

class SendMessageInputBarState extends MessageState {
  final BlocStatusType type;
  final String? error;
  final ChatifySendMessage? message;
  final ChatifyConversation? conversation;

  const SendMessageInputBarState(this.type, {this.error, this.message, this.conversation});

  @override
  // TODO: implement props
  List<Object?> get props => [type, error, message, conversation];
}
