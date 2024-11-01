import 'package:chatify/constant/enum/chat/conversation_enum.dart';
import 'package:chatify/constant/enum/chat/message_enum.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';

class ChatRepo {
  List<ChatifyConversation> conversationItems = [
    ChatifyConversation(
      id: "conv1",
      title: "mwhahaha",
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
    ChatifyConversation(
      id: "conv2",
      type: ConversationType.normal,
      members: <AccountInfo>[
        AccountInfo.huy,
        AccountInfo.nghia,
      ],
      messages: <ChatifyMessage>[
        ChatifyMessage(
          id: "mes1",
          type: MessageType.text,
          conversationId: "conv2",
          senderId: AccountInfo.huy.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "hello2",
        ),
        ChatifyMessage(
          id: "mes2",
          type: MessageType.text,
          conversationId: "conv2",
          senderId: AccountInfo.nghia.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "hi2\naaaaaaaa\n2222222",
        ),
        ChatifyMessage(
          id: "mes3",
          type: MessageType.text,
          conversationId: "conv2",
          senderId: AccountInfo.huy.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "how are you2",
        ),
        ChatifyMessage(
          id: "mes4",
          type: MessageType.text,
          conversationId: "conv2",
          senderId: AccountInfo.nghia.personalInfo.id,
          receivingStatusType: ReceivingMessageStatusType.success,
          sendingStatusType: SendingMessageStatusType.success,
          text: "i am fine2",
        ),
      ],
    ),
  ];

  Future<List<ChatifyConversation>> getUserConversations() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return conversationItems;
    },);
  }

  Future<ChatifyConversation?> getItemInConversations(String conversationId) async {
    if (conversationItems.any((element) => element.id.compareTo(conversationId) == 0)) {
      return conversationItems.firstWhere((element) => element.id.compareTo(conversationId) == 0);
    }
    return null;
  }

  Future<List<ChatifyMessage>> getMessages(String conversationId) async {
    List<ChatifyMessage> messages = [];
    await Future.delayed(const Duration(seconds: 1), () {
      if (conversationItems.any((element) => element.id.compareTo(conversationId) == 0)) {
        messages = conversationItems.firstWhere((element) => element.id.compareTo(conversationId) == 0).messages;
      }
    },);
    return messages;
  }
}