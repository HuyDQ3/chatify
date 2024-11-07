import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

import '../../../model/chat/models.dart';

class ConversationForm extends StatefulWidget {
  const ConversationForm({super.key});

  @override
  State<ConversationForm> createState() => _ConversationFormState();

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ConversationForm());
  }
}

class _ConversationFormState extends State<ConversationForm> {
  late chat_repository.ChatRepository chatRepository;
  late user_repository.UserRepository userRepository;
  late ChatBloc chatBloc;
  late LoginBloc loginBloc;
  User? user;

  @override
  void initState() {
    super.initState();
    chatRepository = context.read<chat_repository.ChatRepository>();
    chatBloc = context.read<ChatBloc>();
    loginBloc = context.read<LoginBloc>();
    if (userRepository.user != null) {
      user = User.userRepositoryUser(
          userRepository.user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstant.chat),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        // listener: (context, state) async {
        //   if (state is GoToMessageScreenState &&
        //       state.type == BlocStatusType.success && !isLoadingMessage) {
        //     isLoadingMessage = true;
        //     await customNavigator.push(context,
        //         MessageScreen(chatifyConversation: state.conversation));
        //     isLoadingMessage = false;
        //   }
        // },
        // buildWhen: (previous, current) {
        //   return current is GetUserConversationsState;
        // },
        builder: (context, state) {
          if (state is ChatLoadInitial) {
            return loadingConversationWidget();
          }
          if (state is ChatLoadInProgress) {
            return loadingConversationWidget();
          }
          if (state is ChatLoadSuccess) {
            return conversations(state.chat.keys.toList());
          }
          if (state is ChatLoadFailure) {
            return failureConversationWidget();
          }
          return loadingConversationWidget();

          // if (state is GetUserConversationsState &&
          //     state.type == BlocStatusType.success) {
          //   switch (state.type) {
          //     case BlocStatusType.initial:
          //     case BlocStatusType.loading:
          //       loadingConversationWidget();
          //     case BlocStatusType.success:
          //       return conversations(state.conversations);
          //     case BlocStatusType.failure:
          //       return failureConversationWidget();
          //   }
          // }
          // return loadingConversationWidget();
        },
      ),
      // body: BlocConsumer<ChatScreenBloc, ChatScreenState>(
      //   bloc: bloc,
      //   listener: (context, state) async {
      //     if (state is GoToMessageScreenState &&
      //         state.type == BlocStatusType.success && !isLoadingMessage) {
      //       isLoadingMessage = true;
      //       await customNavigator.push(context,
      //           MessageScreen(chatifyConversation: state.conversation));
      //       isLoadingMessage = false;
      //     }
      //   },
      //   buildWhen: (previous, current) {
      //     return current is GetUserConversationsState;
      //   },
      //   builder: (context, state) {
      //     if (state is GetUserConversationsState &&
      //         state.type == BlocStatusType.success) {
      //       switch (state.type) {
      //         case BlocStatusType.initial:
      //         case BlocStatusType.loading:
      //           loadingConversationWidget();
      //         case BlocStatusType.success:
      //           return conversations(state.conversations);
      //         case BlocStatusType.failure:
      //           return failureConversationWidget();
      //       }
      //     }
      //     return loadingConversationWidget();
      //   },
      // ),
    );
  }

  Widget conversations(List<Conversation>? items) {
    if (items == null || items.isEmpty) {
      return emptyConversationWidget();
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return conversationItem(items[index]);
      },
    );
  }

  Widget loadingConversationWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(4),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        TextButton(
          onPressed: () {
            chatBloc.add(ChatCrawled(user));
          },
          child: const Text(TextConstant.tryAgain),
        )
      ],
    );

    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget failureConversationWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(4),
          child: const Row(
            children: [
              Icon(Icons.error, size: 48),
              SizedBox.square(dimension: 8),
              Text(
                TextConstant.errorHappenedTryAgainLater,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            chatBloc.add(ChatCrawled(user));
          },
          child: const Text(TextConstant.tryAgain),
        )
      ],
    );
  }

  Widget emptyConversationWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.message, size: 48),
          const SizedBox.square(dimension: 8),
          const Text(
            TextConstant.emptyConversation,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox.square(dimension: 8),
          TextButton(
            onPressed: () {
              chatBloc.add(ChatCrawled(user));
            },
            child: const Text(TextConstant.tryAgain),
          )
        ],
      ),
    );
  }

  Widget loadingMessageWidget() {
    return const CircularProgressIndicator();
  }

  Widget conversationItem(Conversation item) {
    Widget leading = const CircleAvatar(child: Icon(Icons.person));
    String title;
    if (item.title != null) {
      title = item.title!;
    } else {
      List<String> memberNames = [];
      for (var member in item.members) {
        if (member.personalInfo.name != null) {
          memberNames.add(member.personalInfo.name!);
        }
      }
      if (memberNames.isNotEmpty) {
        title = memberNames.join(", ");
      } else {
        title = "";
      }
    }
    return ListTile(
      onTap: () {
        chatBloc.add(ChatConversationTapped(item));
      },
      leading: leading,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item.nearestMessage?.text ?? "",
        // item.messages.isNotEmpty ? item.messages.last.text ?? "" : "",
        overflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox.square(
        dimension: 24,
        child: BlocBuilder<ChatBloc, ChatState>(
          buildWhen: (previous, current) {
            return current is ConversationLoadInProgress || previous is ConversationLoadInProgress;
          },
          builder: (context, state) {
            if (state is ConversationLoadInProgress) {
              return loadingMessageWidget();
            }
            // if (state is GoToMessageScreenState &&
            //     state.type == BlocStatusType.loading &&
            //     state.conversationId?.compareTo(item.id) == 0) {
            //   return loadingMessageWidget();
            // }
            return Container();
          },
        ),
      ),
    );
  }
}
