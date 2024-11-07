import 'package:equatable/equatable.dart';

import 'models.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;

enum MessageType { none, text, image, video }

class Messenger extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  // final List<String>? receiverId;
  final MessageType type;
  SendMessageStatusType sendMessageStatusType;
  ReceiveMessageStatusType receivingMessageStatusType;
  final String? text;
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  Messenger({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    // this.receiverId,
    required this.sendMessageStatusType,
    required this.receivingMessageStatusType,
    this.text,
    this.imageLinks,
    this.videoLinks,
  });

  Messenger.success({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    // this.receiverId,
    this.text,
    this.imageLinks,
    this.videoLinks,
  })  : sendMessageStatusType = SendMessageStatusType.success,
        receivingMessageStatusType = ReceiveMessageStatusType.success;

  static List<Messenger> getTest1Messengers() => [
        Messenger.success(
          id: "mes11",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.huy().id,
          text: "hello",
        ),
        Messenger.success(
          id: "mes12",
          type: MessageType.text,
          conversationId: "conv1",
          senderId: User.nghia().id,
          text: "hi",
        ),
        Messenger.success(
          id: "mes13",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.huy().id,
          text: "how are you",
        ),
        Messenger.success(
          id: "mes14",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.nghia().id,
          text: "i am fine",
        ),
      ];

  static List<Messenger> getTest2Messengers() => [
        Messenger.success(
          id: "mes21",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.huy().id,
          text: "hello2",
        ),
        Messenger.success(
          id: "mes22",
          type: MessageType.text,
          conversationId: "conv1",
          senderId: User.nghia().id,
          text: "hi2",
        ),
        Messenger.success(
          id: "mes23",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.huy().id,
          text: "how are you2",
        ),
        Messenger.success(
          id: "mes24",
          type: MessageType.text,
          conversationId: Conversation.test1().id,
          senderId: User.nghia().id,
          text: "i am fine2",
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
        receivingMessageStatusType,
        text,
        imageLinks,
        videoLinks
      ];

  static Messenger chatRepositoryMessenger(chat_repository.Messenger messenger) {
    return Messenger(
      id: messenger.id,
      receivingMessageStatusType: MessageStatus.chatRepositoryReceiveMessageStatusType(messenger.receiveMessageStatusType),
      sendMessageStatusType: MessageStatus.chatRepositorySendMessageStatusType(messenger.sendMessageStatusType),
      conversationId: messenger.conversationId,
      senderId: messenger.senderId,
      type: chatRepositoryMessageType(messenger.type),
      imageLinks: messenger.imageLinks,
      videoLinks: messenger.videoLinks,
      text: messenger.text,
    );
  }

  static MessageType chatRepositoryMessageType(chat_repository.MessageType type) {
    if (MessageType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      MessageType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return MessageType.none;
  }
}
