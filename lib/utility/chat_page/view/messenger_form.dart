import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/models.dart';
import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart' as user_repository;
import 'package:uuid/uuid.dart';

class MessengerForm extends StatefulWidget {
  const MessengerForm({super.key});

  @override
  State<MessengerForm> createState() => _MessengerFormState();
}

class _MessengerFormState extends State<MessengerForm> {
  late Conversation? conversation;
  late ChatBloc chatBloc;
  late chat_repository.ChatRepository chatRepository;
  late LoginBloc loginBloc;
  late user_repository.UserRepository userRepository;

  // late String title;
  TextEditingController inputBarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // conversation = widget.chatifyConversation;
    // try {
    //   bloc = context.read<MessageBloc>();
    // } catch (e, s) {
    //   logger.log(error: e, stackTrace: s);
    //   bloc = MessageBloc();
    // }
    // if (conversation != null) {
    //   bloc.repo.chatifyConversation =
    //       ChatifyConversation.copyWith(conversation!);
    // }
    // title = conversation?.title ?? TextConstant.conversation;
    chatBloc = context.read<ChatBloc>();
    loginBloc = context.read<LoginBloc>();
    chatRepository = context.read<chat_repository.ChatRepository>();
    userRepository = context.read<user_repository.UserRepository>();
    if (chatRepository.currentConversation != null) {
      conversation = Conversation.fromChatRepositoryConversation(
          chatRepository.currentConversation!);
    }
    // if (userRepository.user != null) {
    //   chatBloc.add(
    //       ChatMessageCrawled(User.fromUserRepositoryUser(userRepository.user!)));
    // }
  }

  @override
  void dispose() {
    inputBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(context),
      ),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is MessengerCrawlSuccess && state.messengers.isNotEmpty) {
                return listOfMessages(state.messengers);
              }
              return emptyMessage();
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: BlocListener<ChatBloc, ChatState>(
                  listener: (context, state) {
                    if (state is MessengerSendSuccess) {
                      inputBarController.clear();
                    }
                  },
                  child: inputBar(sendMessage),
                )),
                const SizedBox.square(
                  dimension: 8,
                ),
                sendMessageButton(sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget title(BuildContext context) {
    return Builder(
      builder: (context) {
        // final title = context.watch<ChatRepository>().currentConversation?.title;
        final title = context
            .watch<chat_repository.ChatRepository>()
            .currentConversation
            ?.getConversationTitle();
        return Text(title ?? "");
      },
    );
  }

  void sendMessage() {
    if (conversation != null &&
        userRepository.user != null &&
        inputBarController.value.text.isNotEmpty) {
      var message = Messenger(
        id: const Uuid().v4(),
        type: MessageType.text,
        conversationId: conversation!.id,
        sendMessageStatusType: SendMessageStatusType.none,
        receiveMessageStatusType: ReceiveMessageStatusType.none,
        senderId: userRepository.user!.id,
        text: inputBarController.value.text,
      );
      chatBloc.add(ChatMessageSent(message));
    }
  }

  Widget sendMessageButton(VoidCallback? callback) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(
        // side: BorderSide()
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: callback,
        child: Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // border: Border()
          ),
          child: const Icon(
            Icons.send,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget inputBar(VoidCallback? sendMessage) {
    return TextFormField(
      controller: inputBarController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: TextConstant.messageHint,
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       BlocBuilder<MessageBloc, MessageState>(
        //         bloc: bloc,
        //         builder: (context, state) {
        //           if (state is SendMessageInputBarState &&
        //               state.type == BlocStatusType.loading) {
        //             return const SizedBox.square(
        //               dimension: 24,
        //               child: CircularProgressIndicator(),
        //             );
        //           }
        //           return const Icon(Icons.chat);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget listOfMessages(List<Messenger> messengers) {
    Iterable<Messenger> reversedMessegers = messengers.reversed;
    return ListView.builder(
      itemBuilder: (context, index) {
        return messageItem(
          reversedMessegers.elementAt(index),
          isCurrentLoginUser: userRepository.user?.id.compareTo(
              reversedMessegers
                  .elementAt(index)
                  .senderId) ==
              0,
        );
      },
      // separatorBuilder: (context, index) {
      //   return SizedBox.square(dimension: 8,);
      // },
      // padding: EdgeInsets.all(8),
      reverse: true,
      itemCount: reversedMessegers.length,
    );
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is MessengerCrawlSuccess) {
          var messages = state.messengers;
          if (messages.isNotEmpty) {
            Iterable<Messenger> reversedMessages = messages.reversed;
            return ListView.builder(
              itemBuilder: (context, index) {
                return messageItem(
                  reversedMessages.elementAt(index),
                  isCurrentLoginUser: userRepository.user?.id.compareTo(
                      reversedMessages
                          .elementAt(index)
                          .senderId) ==
                      0,
                );
              },
              // separatorBuilder: (context, index) {
              //   return SizedBox.square(dimension: 8,);
              // },
              // padding: EdgeInsets.all(8),
              reverse: true,
              itemCount: reversedMessages.length,
            );
          }
        }
        return emptyMessage();
      },
    );
  }

  Widget emptyMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.message, size: 48),
          const SizedBox.square(dimension: 8),
          const Text(
            TextConstant.emptyMessage,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox.square(dimension: 8),
          TextButton(
            onPressed: () {},
            child: const Text(TextConstant.tryAgain),
          )
        ],
      ),
    );
  }

  Widget? messageItem(Messenger message, {bool? isCurrentLoginUser}) {
    if (isCurrentLoginUser ?? false) {
      return currentUserMessageItem(message);
    } else if (!(isCurrentLoginUser ?? false)) {
      return otherUserMessageItem(message);
    }
    return null;
  }

  Widget currentUserMessageItem(Messenger message) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          textBubbleMessage(message.text ?? ""),
        ],
      ),
      trailing: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }

  Widget otherUserMessageItem(Messenger message) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textBubbleMessage(message.text ?? ""),
        ],
      ),
    );
  }

  Widget textBubbleMessage(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 4)),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
