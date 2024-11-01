import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/utility/chat/conversation/repo/chat_repo.dart';
import 'package:equatable/equatable.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  ChatScreenBloc() : super(ChatScreenInitial()) {
    on<ChatScreenEvent>((event, emit) {});
    // lay danh sach cuoc tro chuyen
    on<GetUserConversationsEvent>(_onGetConversationsEvent);
    // lay danh sach tin nhan bang id cuoc tro chuyen
    on<GoToMessageScreenEvent>(_onGetMessagesEvent);
  }

  ChatRepo repo = ChatRepo();

  Future<void> _onGetConversationsEvent(GetUserConversationsEvent event, Emitter<ChatScreenState> emit) async {
    List<ChatifyConversation>? conversations;
    try {
      emit(GetUserConversationsState(BlocStatusType.initial, accountInfo: event.accountInfo, conversations: conversations));
      emit(GetUserConversationsState(BlocStatusType.loading, accountInfo: event.accountInfo, conversations: conversations));
      conversations = await repo.getAllConversations();
      emit(GetUserConversationsState(BlocStatusType.success, accountInfo: event.accountInfo, conversations: conversations));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(GetUserConversationsState(BlocStatusType.failure, error: e.toString(), accountInfo: event.accountInfo, conversations: conversations));
    }
  }

  Future<void> _onGetMessagesEvent(GoToMessageScreenEvent event, Emitter<ChatScreenState> emit) async {
    ChatifyConversation? conversation;
    try {
      emit(GoToMessageScreenState(BlocStatusType.initial, conversationId: event.conversationId, conversation: conversation));
      emit(GoToMessageScreenState(BlocStatusType.loading, conversationId: event.conversationId, conversation: conversation));
      if (event.conversationId == null || event.conversationId!.isEmpty) {
        throw Exception(TextConstant.idIsNotValid);
      }
      conversation = await repo.getConversation(event.conversationId!);
      emit(GoToMessageScreenState(BlocStatusType.success, conversationId: event.conversationId, conversation: conversation));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(GoToMessageScreenState(BlocStatusType.failure, error: e.toString(), conversationId: event.conversationId, conversation: conversation));
    }
  }
}
