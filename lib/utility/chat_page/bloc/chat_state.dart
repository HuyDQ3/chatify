part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class SendMessageInitialState extends ChatState {
  final String messageId;
  final String conversationId;

  const SendMessageInitialState({required this.messageId, required this.conversationId,});

  @override
  List<Object?> get props => [messageId, conversationId];
}

class SendMessageInProcessState extends ChatState {
  final String messageId;
  final String conversationId;

  const SendMessageInProcessState({required this.messageId, required this.conversationId,});

  @override
  List<Object?> get props => [messageId, conversationId];
}

class SendMessageFailureState extends ChatState {
  final String messageId;
  final String conversationId;

  const SendMessageFailureState({required this.messageId, required this.conversationId,});

  @override
  List<Object?> get props => [messageId, conversationId];
}

class SendMessageSuccessState extends ChatState {
  final String messageId;
  final String conversationId;

  const SendMessageSuccessState({required this.messageId, required this.conversationId,});

  @override
  List<Object?> get props => [messageId, conversationId];
}
