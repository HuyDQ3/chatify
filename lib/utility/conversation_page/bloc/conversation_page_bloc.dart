import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'conversation_page_event.dart';
part 'conversation_page_state.dart';

class ConversationPageBloc extends Bloc<ConversationPageEvent, ConversationPageState> {
  ConversationPageBloc() : super(ConversationPageInitial()) {
    on<ConversationPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
