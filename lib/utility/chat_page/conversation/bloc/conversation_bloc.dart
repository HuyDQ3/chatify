import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/model/chat/models.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart' as user_repository;
import 'package:chat_repository/chat_repository.dart' as chat_repository;

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc({
    required this.chatRepository,
    required this.userRepository,
  }) : super(ConversationInitial()) {
    on<ConversationEvent>(_onEvent);
    on<ConversationStarted>(_onCrawled);
    on<ConversationTapped>(_onTapped);
    // on<ConversationAdded>(_onAdded);
  }

  final chat_repository.ChatRepository chatRepository;
  final user_repository.UserRepository userRepository;

  Future<void> _onEvent(
      ConversationEvent event, Emitter<ConversationState> emit) async {
    // logger.log(error: state.runtimeType.toString());
  }

  // Future<void> _onAdded(ConversationAdded event, Emitter<ConversationState> emit) async {
  //
  // }

  Future<void> _onCrawled(
      ConversationStarted event, Emitter<ConversationState> emit) async {
    try {
      emit(ConversationLoadInProgress());
      if (userRepository.user == null) throw Exception("current user is null");
      await chatRepository
          .crawlChatTest(User.toChatRepositoryUser(User.fromUserRepositoryUser(userRepository.user!)));
      List<Conversation> conversations =
          (await chatRepository.getAllConversations())
              .map<Conversation>(
                  (e) => Conversation.fromChatRepositoryConversation(e))
              .toList();
      emit(ConversationLoadSuccess(conversations));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(ConversationLoadFailure());
    }
  }

  Future<void> _onTapped(
      ConversationTapped event, Emitter<ConversationState> emit) async {
    try {
      emit(ConversationTappedInProgress(event.conversation));
      chatRepository.currentConversation = Conversation.toChatRepositoryConversation(event.conversation);
      emit(ConversationTappedSuccess(event.conversation));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(ConversationTappedFailure(event.conversation));
    }
  }
}
