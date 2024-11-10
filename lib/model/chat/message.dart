import 'package:equatable/equatable.dart';

import 'models.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;

enum MessageType { none, text, image, video }

class Message extends Equatable {
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
  MessageContent content;

  Message({
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

  Message.success({
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
        // videoLinks
        content,
      ];

  static Message fromChatRepositoryMessenger(
      chat_repository.ChatRepositoryMessage messenger) {
    return Message(
      id: messenger.id,
      receiveMessageStatusType:
          MessageStatus.fromChatRepositoryReceiveMessageStatusType(
              messenger.receiveMessageStatusType),
      sendMessageStatusType:
          MessageStatus.fromChatRepositorySendMessageStatusType(
              messenger.sendMessageStatusType),
      conversationId: messenger.conversationId,
      senderId: messenger.senderId,
      type: fromChatRepositoryMessageType(messenger.type),
      content:
          MessageContent.fromChatRepositoryMessageContent(messenger.content),
    );
  }

  static chat_repository.ChatRepositoryMessage toChatRepositoryMessenger(
      Message messenger) {
    return chat_repository.ChatRepositoryMessage(
      id: messenger.id,
      receiveMessageStatusType:
          MessageStatus.toChatRepositoryReceiveMessageStatusType(
              messenger.receiveMessageStatusType),
      sendMessageStatusType:
          MessageStatus.toChatRepositorySendMessageStatusType(
              messenger.sendMessageStatusType),
      conversationId: messenger.conversationId,
      senderId: messenger.senderId,
      type: toChatRepositoryMessageType(messenger.type),
      content: MessageContent.toChatRepositoryMessageContent(messenger.content),
    );
  }

  static MessageType fromChatRepositoryMessageType(
      chat_repository.MessageType type) {
    if (MessageType.values
        .any((element) => element.name.compareTo(type.name) == 0)) {
      MessageType.values
          .firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return MessageType.none;
  }

  static chat_repository.MessageType toChatRepositoryMessageType(
      MessageType type) {
    if (chat_repository.MessageType.values
        .any((element) => element.name.compareTo(type.name) == 0)) {
      chat_repository.MessageType.values
          .firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return chat_repository.MessageType.none;
  }
}
