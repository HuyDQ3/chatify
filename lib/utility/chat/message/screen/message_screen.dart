import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/utility/chat/message/bloc/message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
    this.chatifyConversation,
  });

  final ChatifyConversation? chatifyConversation;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late ChatifyConversation? conversation;
  late MessageBloc bloc;
  late String title;
  TextEditingController inputBarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    conversation = widget.chatifyConversation;
    try {
      bloc = context.read<MessageBloc>();
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      bloc = MessageBloc();
    }
    if (conversation != null) {
      bloc.repo.chatifyConversation =
          ChatifyConversation.copyWith(conversation!);
    }
    title = conversation?.title ?? TextConstant.conversation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocConsumer<MessageBloc, MessageState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SendMessageInputBarState &&
              state.type == BlocStatusType.success) {
            conversation = state.conversation;
          }
          return Column(
            children: [
              Expanded(
                child: messages(conversation?.listOfMessages),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: inputBar(sendMessage)),
                    const SizedBox.square(
                      dimension: 8,
                    ),
                    sendMessageButton(sendMessage),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  sendMessage() {
    if (conversation != null &&
        AccountInfo.currentLoginAccount != null &&
        inputBarController.value.text.isNotEmpty) {
      var message = ChatifySendMessage(
        conversationId: conversation!.id,
        senderId: AccountInfo.currentLoginAccount!.id,
        text: inputBarController.value.text,
      );
      bloc.add(SendMessageInputBar(message: message));
      inputBarController.clear();
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
          child: const Icon(Icons.send, color: Colors.blue,),
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

  Widget messages(List<ChatifyMessage>? messages) {
    if (messages != null && messages.isNotEmpty) {
      Iterable<ChatifyMessage> reversedMessages = messages.reversed;
      return ListView.builder(
        itemBuilder: (context, index) {
          return messageItem(
            reversedMessages.elementAt(index),
            isCurrentLoginUser: AccountInfo.currentLoginAccount
                ?.isCurrentLoginAccount(
                    reversedMessages.elementAt(index).senderId),
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
    return emptyMessage();
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

  Widget? messageItem(ChatifyMessage message, {bool? isCurrentLoginUser}) {
    if (isCurrentLoginUser ?? false) {
      return currentUserMessageItem(message);
    } else if (!(isCurrentLoginUser ?? false)) {
      return otherUserMessageItem(message);
    }
    return null;
  }

  Widget currentUserMessageItem(ChatifyMessage message) {
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

  Widget otherUserMessageItem(ChatifyMessage message) {
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
        ]
      ),
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}
