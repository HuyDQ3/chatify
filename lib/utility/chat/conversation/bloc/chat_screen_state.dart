part of 'chat_screen_bloc.dart';

sealed class ChatScreenState extends Equatable {
  const ChatScreenState();
}

final class ChatScreenInitial extends ChatScreenState {
  @override
  List<Object> get props => [];
}

class GetUserConversationsState extends ChatScreenState {
  final BlocStatusType type;
  final String? error;
  final AccountInfo? accountInfo;
  final List<ChatifyConversation>? conversations;

  const GetUserConversationsState(this.type, {this.error, this.accountInfo, this.conversations});

  @override
  List<Object?> get props => [type, error, accountInfo, conversations];
}

class GoToMessageScreenState extends ChatScreenState {
  final BlocStatusType type;
  final String? error;
  final String? conversationId;
  final ChatifyConversation? conversation;

  const GoToMessageScreenState(this.type, {this.error, this.conversationId, this.conversation});

  @override
  List<Object?> get props => [type, error, conversationId, conversation];
}
