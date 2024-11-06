import 'package:chat_repository/src/models/models.dart';

enum SendingMessageStatusType { none, initial, loading, success, failure }

enum ReceivingMessageStatusType { none, initial, loading, success, failure }

class MessageStatus {
  final Conversation? conversation;
  final Message message;
  SendingMessageStatusType _sendingMessageStatusType =
      SendingMessageStatusType.none;
  ReceivingMessageStatusType _receivingMessageStatusType =
      ReceivingMessageStatusType.none;

  MessageStatus({
    required this.message,
    this.conversation,
    required SendingMessageStatusType sendingMessageStatusType,
    required ReceivingMessageStatusType receivingMessageStatusType,
  })  : _sendingMessageStatusType = sendingMessageStatusType,
        _receivingMessageStatusType = receivingMessageStatusType;

  ReceivingMessageStatusType get receivingMessageStatusType =>
      _receivingMessageStatusType;

  set receivingMessageStatusType(ReceivingMessageStatusType value) {
    _receivingMessageStatusType = value;
  }

  SendingMessageStatusType get sendingMessageStatusType =>
      _sendingMessageStatusType;

  set sendingMessageStatusType(SendingMessageStatusType value) {
    _sendingMessageStatusType = value;
  }
}
