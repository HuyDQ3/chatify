import 'package:chatify/constant/text/text_constant.dart';
import 'package:flutter/material.dart';

class ConversationForm extends StatefulWidget {
  const ConversationForm({super.key});

  @override
  State<ConversationForm> createState() => _ConversationFormState();
}

class _ConversationFormState extends State<ConversationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstant.chat),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<ChatScreenBloc, ChatScreenState>(
        bloc: bloc,
        listener: (context, state) async {
          if (state is GoToMessageScreenState &&
              state.type == BlocStatusType.success && !isLoadingMessage) {
            isLoadingMessage = true;
            await customNavigator.push(context,
                MessageScreen(chatifyConversation: state.conversation));
            isLoadingMessage = false;
          }
        },
        buildWhen: (previous, current) {
          return current is GetUserConversationsState;
        },
        builder: (context, state) {
          if (state is GetUserConversationsState &&
              state.type == BlocStatusType.success) {
            switch (state.type) {
              case BlocStatusType.initial:
              case BlocStatusType.loading:
                loadingConversationWidget();
              case BlocStatusType.success:
                return conversations(state.conversations);
              case BlocStatusType.failure:
                return failureConversationWidget();
            }
          }
          return loadingConversationWidget();
        },
      ),
    );
  }
}
