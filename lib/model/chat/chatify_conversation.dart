import 'package:chatify/constant/enum/chat/conversation_enum.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/model/info/personal_info.dart';

class Conversation {
  final String id;
  ConversationType type;
  List<AccountInfo> members;
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
