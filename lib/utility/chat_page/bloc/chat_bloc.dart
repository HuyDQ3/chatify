import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:chat_repository/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;

  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatInitial()) {
    on<ChatEvent>((event, emit) {});

    on<ChatMessageSent>(_onChatMessageSent);
  }

  Future<void> _onChatMessageSent(
      ChatMessageSent event, Emitter<ChatState> emit) async {
    return emit.onEach(
      _chatRepository.messageStatus,
      onData: (data) {
        switch (data.sendingMessageStatusType) {
          case SendingMessageStatusType.none:
          case SendingMessageStatusType.initial:
            emit(SendMessageInitialState(
              messageId: event.message.id,
              conversationId: event.message.conversationId,
            ));
          case SendingMessageStatusType.loading:
            emit(SendMessageInProcessState(
              messageId: event.message.id,
              conversationId: event.message.conversationId,
            ));
          case SendingMessageStatusType.success:
            emit(SendMessageSuccessState(
              messageId: event.message.id,
              conversationId: event.message.conversationId,
            ));
          case SendingMessageStatusType.failure:
            emit(SendMessageFailureState(
              messageId: event.message.id,
              conversationId: event.message.conversationId,
            ));
        }
        switch (data.receivingMessageStatusType) {
          case ReceivingMessageStatusType.none:
          // TODO: Handle this case.
          case ReceivingMessageStatusType.initial:
          // TODO: Handle this case.
          case ReceivingMessageStatusType.loading:
          // TODO: Handle this case.
          case ReceivingMessageStatusType.success:
          // TODO: Handle this case.
          case ReceivingMessageStatusType.failure:
          // TODO: Handle this case.
        }
      },
      onError: (error, stackTrace) {
        emit(SendMessageFailureState(
          messageId: event.message.id,
          conversationId: event.message.conversationId,
        ));
      },
    );
  }
}
