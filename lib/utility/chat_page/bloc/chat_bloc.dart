import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart'
    as chat_repository;
import 'package:chatify/service/error/custom_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:chatify/model/chat/models.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final chat_repository.ChatRepository _chatRepository;

  ChatBloc({required chat_repository.ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatInitial()) {
    on<ChatEvent>((event, emit) {});

    on<ChatMessageSent>(_onChatMessageSent);

    on<ChatCrawled>(_onChatCrawled);

    on<ChatConversationCrawled>(_onChatConversationCrawled);

    on<ChatMessageCrawled>(_onChatMessageCrawled);

    on<ChatConversationPushToMessagePage>(_onChatConversationPushToMessagePage);
  }

  Future<void> _onChatMessageSent(
      ChatMessageSent event, Emitter<ChatState> emit) async {
    return emit.onEach(
      _chatRepository.messageStatus,
      onData: (data) {
        switch (MessageStatus.fromChatRepositorySendMessageStatusType(
            data.sendMessageStatusType)) {
          case SendMessageStatusType.none:
          case SendMessageStatusType.initial:
            emit(MessengerSendInitial(event.messenger));
            break;
          case SendMessageStatusType.loading:
            emit(MessengerSendInProgress(event.messenger));
            break;
          case SendMessageStatusType.success:
            emit(MessengerSendSuccess(event.messenger));
            break;
          case SendMessageStatusType.failure:
            emit(MessengerSendFailure(event.messenger));
            break;
        }
        switch (MessageStatus.fromChatRepositoryReceiveMessageStatusType(
            data.receiveMessageStatusType)) {
          case ReceiveMessageStatusType.none:
          case ReceiveMessageStatusType.initial:
            emit(MessengerReceiveInitial(event.messenger));
            break;
          case ReceiveMessageStatusType.loading:
            emit(MessengerReceiveInProgress(event.messenger));
            break;
          case ReceiveMessageStatusType.success:
            emit(MessengerReceiveSuccess(event.messenger));
            break;
          case ReceiveMessageStatusType.failure:
            emit(MessengerReceiveFailure(event.messenger));
            break;
        }
      },
      onError: (error, stackTrace) {
        logger.log(error: error, stackTrace: stackTrace);
        emit(MessengerSendFailure(event.messenger));
      },
    );
  }

  Future<void> _onChatCrawled(
      ChatCrawled event, Emitter<ChatState> emit) async {
    try {
      emit(ChatCrawlInitial());
      emit(ChatCrawlInProgress());
      await _chatRepository.crawlChatTest();
      // List<Conversation> conversations = List.generate(_chatRepository.getAllConversations.length, (index) => Conversation.chatRepositoryConversation(_chatRepository.getAllConversations.elementAt(index)));
      var chat = await _chatRepository.getAllMessagesAndConversations();
      emit(ChatCrawlSuccess(chat.map((key, value) => MapEntry(
              Conversation.fromChatRepositoryConversation(key),
              value
                  .map<Messenger>((e) => Messenger.fromChatRepositoryMessenger(e))
                  .toList()))));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(ChatCrawlFailure());
    }
  }

  Future<void> _onChatConversationPushToMessagePage(
      ChatConversationPushToMessagePage event, Emitter<ChatState> emit) async {
    // try {
    //   emit(const MessengerCrawlInitial());
    //   emit(const MessengerCrawlInProgress());
    //   List<chat_repository.Messenger> messengers = await _chatRepository.getMessagesFromConversation(Conversation.toChatRepositoryConversation(event.conversation))..map((e) => Messenger.fromChatRepositoryMessenger(e));
    //   emit(MessengerCrawlSuccess(messengers.map((e) => Messenger.fromChatRepositoryMessenger(e)).toList()));
    // } catch (e, s) {
    //   logger.log(error: e, stackTrace: s);
    //   emit(const MessengerCrawlFailure());
    // }
    add(ChatMessageCrawled(event.conversation));
  }

  Future<void> _onChatConversationCrawled(
      ChatConversationCrawled event, Emitter<ChatState> emit) async {
    try {
      emit(const ConversationCrawlInitial());
      emit(const ConversationCrawlInProgress());
      var conversations = _chatRepository.getAllConversations;
      emit(ConversationCrawlSuccess(conversations.map((e) => Conversation.fromChatRepositoryConversation(e)).toList()));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(const ConversationCrawlFailure());
    }
  }

  Future<void> _onChatMessageCrawled(
      ChatMessageCrawled event, Emitter<ChatState> emit) async {
    try {
      emit(const MessengerCrawlInitial());
      emit(const MessengerCrawlInProgress());
      var messengers = await _chatRepository.getMessagesFromConversation(Conversation.toChatRepositoryConversation(event.conversation))..map((e) => Messenger.fromChatRepositoryMessenger(e));
      emit(MessengerCrawlSuccess(messengers.map((e) => Messenger.fromChatRepositoryMessenger(e)).toList()));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(const MessengerCrawlFailure());
    }
  }
}
