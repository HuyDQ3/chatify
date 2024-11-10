part of 'conversation_bloc.dart';

sealed class ConversationState extends Equatable {
  const ConversationState();
}

final class ConversationInitial extends ConversationState {
  @override
  List<Object> get props => [];
}

class ConversationLoadInProgress extends ConversationState {
  @override
  List<Object?> get props => [];
}

class ConversationLoadSuccess extends ConversationState {
  final List<Conversation> conversations;

  const ConversationLoadSuccess(this.conversations);

  @override
  List<Object?> get props => [];
}

class ConversationLoadFailure extends ConversationState {
  @override
  List<Object?> get props => [];
}

class ConversationTappedInProgress extends ConversationState {
  final Conversation conversation;

  const ConversationTappedInProgress(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ConversationTappedSuccess extends ConversationState {
  final Conversation conversation;

  const ConversationTappedSuccess(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class ConversationTappedFailure extends ConversationState {
  final Conversation conversation;

  const ConversationTappedFailure(this.conversation);

  @override
  List<Object?> get props => [conversation];
}
