import 'package:chatify/constant/enum/chat/conversation_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';

class ChatifyConversation {
  final String id;
  ConversationType type;
  List<AccountInfo> members;
  List<ChatifyMessage> messages;
  ChatifyMessage? nearestMessage;
  late String? title;

  ChatifyConversation({
    required this.id,
    required this.type,
    required this.members,
    required this.messages,
    this.nearestMessage,
    this.title,
  }) {
    title ??= getConversationTitle();
  }

  factory ChatifyConversation.copyWith(
      ChatifyConversation chatifyConversation) {
    return ChatifyConversation(
      id: chatifyConversation.id,
      type: chatifyConversation.type,
      members: chatifyConversation.members,
      messages: chatifyConversation.messages,
    );
  }

  String getConversationTitle() {
    String temp = TextConstant.conversation;
    List<String> memberNames = [];
    members.removeWhere((element) =>
        AccountInfo.currentLoginAccount
            ?.isCurrentLoginAccount(element.personalInfo.id) ??
        false);
    for (var member in members) {
      if (member.personalInfo.name != null) {
        memberNames.add(member.personalInfo.name!);
      }
    }
    if (memberNames.isNotEmpty) {
      temp = memberNames.join(", ");
    }
    return temp;
  }
}
