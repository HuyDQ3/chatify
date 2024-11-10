import 'package:equatable/equatable.dart';

import 'models.dart';

enum MessageType { none, text, image, video }

class ChatRepositoryMessage extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  // final List<String>? receiverId;
  final MessageType type;
  SendMessageStatusType sendMessageStatusType;
  ReceiveMessageStatusType receiveMessageStatusType;
  // final String? text;
  // final List<String>? imageLinks;
  // final List<String>? videoLinks;
  ChatRepositoryMessageContent content;

  ChatRepositoryMessage({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    // this.receiverId,
    required this.sendMessageStatusType,
    required this.receiveMessageStatusType,
    // this.text,
    // this.imageLinks,
    // this.videoLinks,
    required this.content,
  });

  ChatRepositoryMessage.success({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    // this.receiverId,
    // this.text,
    // this.imageLinks,
    // this.videoLinks,
    required this.content,
  })  : sendMessageStatusType = SendMessageStatusType.success,
        receiveMessageStatusType = ReceiveMessageStatusType.success;

  ChatRepositoryMessage.none({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    // this.receiverId,
    // this.text,
    // this.imageLinks,
    // this.videoLinks,
    required this.content,
  })  : sendMessageStatusType = SendMessageStatusType.none,
        receiveMessageStatusType = ReceiveMessageStatusType.none;

  static List<ChatRepositoryMessage> getTest1Messengers() => [
        ChatRepositoryMessage.success(
          id: "mes11",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.huy().id,
          content: ChatRepositoryMessageContent(text: "hello"),
          // text: "hello",
        ),
        ChatRepositoryMessage.success(
          id: "mes12",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.nghia().id,
          content: ChatRepositoryMessageContent(text: "hi"),
        ),
        ChatRepositoryMessage.success(
          id: "mes13",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.huy().id,
          content: ChatRepositoryMessageContent(text: "how are you"),
        ),
        ChatRepositoryMessage.success(
          id: "mes14",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.nghia().id,
          content: ChatRepositoryMessageContent(text: "i am fine"),
        ),
      ];

  static List<ChatRepositoryMessage> getTest2Messengers() => [
        ChatRepositoryMessage.success(
          id: "mes21",
          type: MessageType.text,
          conversationId: Conversation.test2().id,
          senderId: User.huy().id,
          content: ChatRepositoryMessageContent(text: "hello2"),
        ),
        ChatRepositoryMessage.success(
          id: "mes22",
          type: MessageType.text,
          conversationId: Conversation.test2().id,
          senderId: User.nghia().id,
          content: ChatRepositoryMessageContent(text: "hi2"),
        ),
        ChatRepositoryMessage.success(
          id: "mes23",
          type: MessageType.text,
          conversationId: Conversation.test2().id,
          senderId: User.huy().id,
          content: ChatRepositoryMessageContent(text: "how are you2"),
        ),
        ChatRepositoryMessage.success(
          id: "mes24",
          type: MessageType.text,
          conversationId: Conversation.test2().id,
          senderId: User.nghia().id,
          content: ChatRepositoryMessageContent(text: "i am fine2"),
        ),
      ];

  @override
  List<Object?> get props => [
        id,
        conversationId,
        type,
        senderId,
        // receiverId,
        sendMessageStatusType,
        receiveMessageStatusType,
        // text,
        // imageLinks,
        // videoLinks,
        content,
      ];
}
