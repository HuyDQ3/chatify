import 'package:bloc/bloc.dart';
import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:equatable/equatable.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  ChatScreenBloc() : super(ChatScreenInitial()) {
    on<ChatScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
