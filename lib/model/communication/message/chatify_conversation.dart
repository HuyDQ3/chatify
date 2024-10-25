import 'package:chatify/constant/enum/conversation_type.dart';
import 'package:chatify/model/communication/message/chatify_message.dart';
import 'package:chatify/model/info/personal_info.dart';

class Conversation {
  final String id;
  ConversationType type;
  List<PersonalInfo> members;
  List<ChatifyMessage> messages;
  ChatifyMessage? nearestMessage;

  Conversation({
    required this.id,
    required this.type,
    required this.members,
    required this.messages,
    this.nearestMessage,
  });
}
