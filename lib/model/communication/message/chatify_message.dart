import 'package:chatify/constant/enum/message_status_type.dart';
import 'package:chatify/constant/enum/message_type.dart';

class ChatifyMessage {
  final String id;
  final String conversationId;
  final MessageType? type;
  final SendingMessageStatusType? sendingStatusType;
  final ReceivingMessageStatusType? receivingStatusType;
  final String? text;
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  ChatifyMessage({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.sendingStatusType,
    required this.receivingStatusType,
    this.text,
    this.imageLinks,
    this.videoLinks,
  });
}
