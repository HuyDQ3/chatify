import 'models.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;

enum SendMessageStatusType { none, initial, loading, success, failure }

enum ReceiveMessageStatusType { none, initial, loading, success, failure }

class MessageStatus {
  final Conversation? conversation;
  final Messenger message;
  SendMessageStatusType sendMessageStatusType;
  ReceiveMessageStatusType receiveMessageStatusType;

  MessageStatus({
    required this.message,
    this.conversation,
    required this.sendMessageStatusType,
    required this.receiveMessageStatusType,
  });

  MessageStatus.success({required this.message, this.conversation})
      : sendMessageStatusType = SendMessageStatusType.success,
        receiveMessageStatusType = ReceiveMessageStatusType.success;

  MessageStatus.none({required this.message, this.conversation})
      : sendMessageStatusType = SendMessageStatusType.none,
        receiveMessageStatusType = ReceiveMessageStatusType.none;

  static SendMessageStatusType fromChatRepositorySendMessageStatusType(chat_repository.SendMessageStatusType type) {
    if (SendMessageStatusType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      return SendMessageStatusType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return SendMessageStatusType.none;
  }

  static chat_repository.SendMessageStatusType toChatRepositorySendMessageStatusType(SendMessageStatusType type) {
    if (chat_repository.SendMessageStatusType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      return chat_repository.SendMessageStatusType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return chat_repository.SendMessageStatusType.none;
  }

  static ReceiveMessageStatusType fromChatRepositoryReceiveMessageStatusType(chat_repository.ReceiveMessageStatusType type) {
    if (ReceiveMessageStatusType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      return ReceiveMessageStatusType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return ReceiveMessageStatusType.none;
  }

  static chat_repository.ReceiveMessageStatusType toChatRepositoryReceiveMessageStatusType(ReceiveMessageStatusType type) {
    if (chat_repository.ReceiveMessageStatusType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      return chat_repository.ReceiveMessageStatusType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return chat_repository.ReceiveMessageStatusType.none;
  }
}
