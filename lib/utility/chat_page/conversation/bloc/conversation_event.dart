part of 'conversation_bloc.dart';

sealed class ConversationEvent extends Equatable {
  const ConversationEvent();
}

class ConversationStarted extends ConversationEvent {
  @override
  List<Object?> get props => [];
}

class ConversationTapped extends ConversationEvent {
  final Conversation conversation;

  const ConversationTapped(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

// class ConversationAdded extends ConversationEvent {
//   final Conversation conversation;
//
//   const ConversationAdded(this.conversation);
//
//   @override
//   List<Object?> get props => [conversation];
// }