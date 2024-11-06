part of 'conversation_page_bloc.dart';

sealed class ConversationPageState extends Equatable {
  const ConversationPageState();
}

final class ConversationPageInitial extends ConversationPageState {
  @override
  List<Object> get props => [];
}
