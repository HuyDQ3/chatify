part of 'chat_screen_bloc.dart';

sealed class ChatScreenEvent extends Equatable {
  const ChatScreenEvent();
}

class GetUserConversationsEvent extends ChatScreenEvent {
  final AccountInfo? accountInfo;

  const GetUserConversationsEvent({this.accountInfo});

  @override
  List<Object?> get props => [accountInfo];
}

class GoToMessageScreenEvent extends ChatScreenEvent {
  final String? conversationId;

  const GoToMessageScreenEvent({this.conversationId});

  @override
  List<Object?> get props => [conversationId];
}
