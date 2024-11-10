import 'package:chat_repository/src/models/models.dart';

enum SendMessageStatusType { none, initial, loading, success, failure }

enum ReceiveMessageStatusType { none, initial, loading, success, failure }

class MessageStatus {
  final Conversation? conversation;
  final ChatRepositoryMessage message;
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

  MessageStatus.send({required this.message, this.conversation, required this.sendMessageStatusType})
      : receiveMessageStatusType = ReceiveMessageStatusType.none;

  MessageStatus.receive({required this.message, this.conversation, required this.receiveMessageStatusType})
      : sendMessageStatusType = SendMessageStatusType.none;
}
