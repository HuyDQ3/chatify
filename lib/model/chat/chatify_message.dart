import 'package:chatify/constant/enum/chat/message_enum.dart';

class ChatifyMessage {
  final String id;
  final String conversationId;
  final String senderId;
  final List<String>? receiverId;
  final MessageType type;
  final SendingMessageStatusType sendingStatusType;
  final ReceivingMessageStatusType receivingStatusType;
  final String? text;
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  ChatifyMessage({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    this.receiverId,
    required this.sendingStatusType,
    required this.receivingStatusType,
    this.text,
    this.imageLinks,
    this.videoLinks,
  });
}
