import 'package:chatify/constant/chatify_app_constant.dart';
import 'package:chatify/constant/enum/chat/conversation_enum.dart';
import 'package:chatify/constant/enum/chat/message_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/service/error/custom_logger.dart';

class ChatRepo {
  static List<ChatifyConversation> conversationItems = [
    ChatifyConversation(
      id: "conv1",
      title: "mwhahaha",
      type: ConversationType.normal,
      members: <AccountInfo>[
        AccountInfo.huy,
        AccountInfo.nghia,
      ],
      listOfMessages: <ChatifyMessage>[
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
      listOfMessages: <ChatifyMessage>[
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

  Future<List<ChatifyConversation>> getAllConversations() async {
    return Future.delayed(
      Duration(milliseconds: ChatifyAppConstant.loadingMilliSecond),
      () {
        return conversationItems;
      },
    );
  }

  Future<ChatifyConversation?> getConversation(String conversationId) async {
    if (conversationItems
        .any((element) => element.id.compareTo(conversationId) == 0)) {
      return conversationItems
          .firstWhere((element) => element.id.compareTo(conversationId) == 0);
    }
    return null;
  }

  static Future<List<ChatifyMessage>> getMessagesInConversation(
      String conversationId) async {
    List<ChatifyMessage> messages = [];
    await Future.delayed(
      Duration(milliseconds: ChatifyAppConstant.loadingMilliSecond),
      () {
        if (conversationItems
            .any((element) => element.id.compareTo(conversationId) == 0)) {
          messages = conversationItems
              .firstWhere(
                  (element) => element.id.compareTo(conversationId) == 0)
              .listOfMessages;
        }
      },
    );
    return messages;
  }

  static Future<ChatifyMessage?> sendMessage(
      String conversationId, ChatifySendMessage message) async {
    ChatifyMessage? chatifyMessage;
    await Future.delayed(
      Duration(milliseconds: ChatifyAppConstant.loadingMilliSecond),
      () async {
        try {
          if (conversationItems
              .any((element) => element.id.compareTo(conversationId) == 0)) {
            chatifyMessage = await setMessageTypeWhenSendMessage(message);
            conversationItems
                .firstWhere(
                    (element) => element.id.compareTo(conversationId) == 0)
                .listOfMessages
                .add(chatifyMessage!);
          } else {
            throw Exception(TextConstant.conversationIdNotFound);
          }
        } catch (e, s) {
          logger.log(error: e, stackTrace: s);
          rethrow;
        }
      },
    );
    return chatifyMessage;
  }

  static Future<ChatifyMessage> setMessageTypeWhenSendMessage(
      ChatifySendMessage message) async {
    MessageType type = message.type;
    if (message.imageLinks != null && message.imageLinks!.isNotEmpty) {
      type = MessageType.constantImage;
    } else if (message.videoLinks != null && message.videoLinks!.isNotEmpty) {
      type = MessageType.video;
    } else if (message.text != null && message.text!.isNotEmpty) {
      type = MessageType.text;
    } else {
      type = MessageType.none;
    }
    return ChatifyMessage(
      id: message.id,
      conversationId: message.conversationId,
      type: type,
      senderId: message.senderId,
      text: message.text,
      sendingStatusType: message.sendingStatusType,
      receivingStatusType: message.receivingStatusType,
    );
  }
}
