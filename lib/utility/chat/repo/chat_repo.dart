import 'package:chatify/constant/enum/chat/conversation_enum.dart';
import 'package:chatify/constant/enum/chat/message_enum.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';

class ChatRepo {
  List<Conversation> conversationItems = [
    Conversation(
      id: "conv1",
      type: ConversationType.normal,
      members: <AccountInfo>[
        AccountInfo.huy,
        AccountInfo.nghia,
      ],
      messages: <ChatifyMessage>[
        ChatifyMessage(
          id: "mes1",
          type: MessageType.text,
          conversationId: "conv1",
          senderId: AccountInfo.huy.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "hello",
        ),
        ChatifyMessage(
          id: "mes2",
          type: MessageType.text,
          conversationId: "conv1",
          senderId: AccountInfo.nghia.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "hi",
        ),
        ChatifyMessage(
          id: "mes3",
          type: MessageType.text,
          conversationId: "conv1",
          senderId: AccountInfo.huy.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "how are you",
        ),
        ChatifyMessage(
          id: "mes4",
          type: MessageType.text,
          conversationId: "conv1",
          senderId: AccountInfo.nghia.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "i am fine",
        ),
      ],
    ),
  ];

  Future<List<Conversation>> getConversationItems() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return conversationItems;
    },);
  }
}