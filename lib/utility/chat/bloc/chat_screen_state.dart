part of 'chat_screen_bloc.dart';

sealed class ChatScreenState extends Equatable {
  const ChatScreenState();
}

final class ChatScreenInitial extends ChatScreenState {
  @override
  List<Object> get props => [];
}

class GetConversationItems extends ChatScreenState {
  final BlocStatusType type;
  final String? error;
  final AccountInfo? accountInfo;

  const GetConversationItems(this.type, {this.error, this.accountInfo});

  @override
  List<Object?> get props => [type, error, accountInfo];
}
