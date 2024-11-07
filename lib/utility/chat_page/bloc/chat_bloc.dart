import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/package/chat_repository/lib/chat_repository.dart' as chat_repository;
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

    on<ChatConversationTapped>(_onChatConversationTapped);
  }

  Future<void> _onChatMessageSent(
      ChatMessageSent event, Emitter<ChatState> emit) async {
    return emit.onEach(
      _chatRepository.messageStatus,
      onData: (data) {
        switch (MessageStatus.chatRepositorySendMessageStatusType(data.sendMessageStatusType)) {
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
        switch (MessageStatus.chatRepositoryReceiveMessageStatusType(data.receiveMessageStatusType)) {
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
      ChatCrawled event,
      Emitter<ChatState> emit) async {
    emit(ChatLoadInitial());
    emit(ChatLoadInProgress());
    await _chatRepository.crawlChatTest();
    emit(ChatLoadSuccess(chat));
  }

  Future<void> _onChatConversationTapped(
      ChatConversationTapped event, Emitter<ChatState> emit) async {}

  Future<void> _onChatConversationCrawled(ChatConversationCrawled event, Emitter<ChatState> emit) async {

  }

  Future<void> _onChatMessageCrawled(ChatMessageCrawled event, Emitter<ChatState> emit) async {

  }
}
