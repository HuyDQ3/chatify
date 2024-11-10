import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/model/chat/models.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc({required this.chatRepository, required this.userRepository})
      : super(MessageInitial()) {
    on<MessageEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MessageStarted>(_onStarted);

    on<MessageSent>(_onSent);

    on<MessageReceived>(_onReceived);
  }

  chat_repository.ChatRepository chatRepository;
  user_repository.UserRepository userRepository;

  Future<void> _onStarted(
      MessageStarted event, Emitter<MessageState> emit) async {
    try {
      emit(MessageLoadInProgress());
      if (userRepository.user == null) {
        throw Exception("current account is null");
      }
      if (chatRepository.currentConversation == null) {
        throw Exception("current conversation is null");
      }
      await chatRepository.crawlChatTest(User.toChatRepositoryUser(
          User.fromUserRepositoryUser(userRepository.user!)));
      List<Message> messages =
          (await chatRepository.getMessagesFromCurrentConversation() ?? [])
              .map<Message>((e) => Message.fromChatRepositoryMessenger(e))
              .toList();
      emit(MessageLoadSuccess(messages));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(MessageLoadFailure());
    }
  }

  Future<void> _onSent(MessageSent event, Emitter<MessageState> emit) async {
    try {
      emit(const MessageSendInProgress());
      await chatRepository.sendMessage(
        senderId: event.senderId,
        conversationId: event.conversationId,
        content: MessageContent.toChatRepositoryMessageContent(event.content),
      );
      emit(const MessageSendSuccess());
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(const MessageSendFailure());
    }
  }

  Future<void> _onReceived(MessageReceived event, Emitter<MessageState> emit) async {
    return emit.onEach(
      chatRepository.receivedMessage,
      onData: (data) async {
        List<Message> messages =
        (await chatRepository.getMessagesFromCurrentConversation() ?? [])
            .map<Message>((e) => Message.fromChatRepositoryMessenger(e))
            .toList();
        // return emit(MessageLoadSuccess(messages));
        return emit(MessageReceiveSuccess(messages));
      },
      onError: (error, stackTrace) {
        return emit(const MessageReceiveFailure());
      },
    );
  }
}
