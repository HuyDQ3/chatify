import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/utility/chat/message/repo/message_repo.dart';
import 'package:equatable/equatable.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitial()) {
    on<MessageEvent>((event, emit) {});
    on<SendMessageInputBar>(_sendMessageInputBar);
  }

  MessageRepo repo = MessageRepo();

  Future<void> _sendMessageInputBar(
      SendMessageInputBar event, Emitter<MessageState> emit) async {
    try {
      emit(SendMessageInputBarState(
        BlocStatusType.initial,
        message: event.message,
        conversation: repo.chatifyConversation,
      ));
      emit(SendMessageInputBarState(
        BlocStatusType.loading,
        message: event.message,
        conversation: repo.chatifyConversation,
      ));
      if (event.message != null) {
        await repo.sendMessage(event.message!);
        emit(SendMessageInputBarState(
          BlocStatusType.success,
          message: event.message,
          conversation: repo.chatifyConversation,
        ));
      } else {
        throw Exception(TextConstant.messageModelIsNull);
      }
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(SendMessageInputBarState(
        BlocStatusType.failure,
        error: e.toString(),
        message: event.message,
        conversation: repo.chatifyConversation,
      ));
    }
  }
}
