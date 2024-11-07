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

  static SendMessageStatusType chatRepositorySendMessageStatusType(chat_repository.SendMessageStatusType type) {
    if (SendMessageStatusType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      return SendMessageStatusType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return SendMessageStatusType.none;
  }

  static ReceiveMessageStatusType chatRepositoryReceiveMessageStatusType(chat_repository.ReceiveMessageStatusType type) {
    if (ReceiveMessageStatusType.values.any((element) => element.name.compareTo(type.name) == 0)) {
      return ReceiveMessageStatusType.values.firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return ReceiveMessageStatusType.none;
  }
}
