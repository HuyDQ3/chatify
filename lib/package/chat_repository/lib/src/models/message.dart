import 'package:equatable/equatable.dart';

import 'models.dart';

enum MessageType { none, text, image, video }

class Message extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  // final List<String>? receiverId;
  final MessageType type;
  final MessageStatus messageStatus;
  final String? text;
  final List<String>? imageLinks;
  final List<String>? videoLinks;

  Message({
    required this.id,
    required this.conversationId,
    required this.type,
    required this.senderId,
    // this.receiverId,
    required this.messageStatus,
    this.text,
    this.imageLinks,
    this.videoLinks,
  });

  @override
  List<Object?> get props => [
        id,
        conversationId,
        type,
        senderId,
        // receiverId,
        // sendingStatusType,
        // receivingStatusType,
        messageStatus,
        text,
        imageLinks,
        videoLinks
      ];
}
