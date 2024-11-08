import 'package:equatable/equatable.dart';

import 'models.dart';

enum MessageType { none, text, image, video }

class Messenger extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  // final List<String>? receiverId;
  final MessageType type;
  SendMessageStatusType sendMessageStatusType;
  ReceiveMessageStatusType receiveMessageStatusType;
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
    required this.receiveMessageStatusType,
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
        receiveMessageStatusType = ReceiveMessageStatusType.success;

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
        receiveMessageStatusType,
        text,
        imageLinks,
        videoLinks
      ];
}
