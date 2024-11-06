import 'package:chatify/constant/enum/chat/conversation_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/model/info/account_info.dart';

class Conversation {
  final String id;
  ConversationType type;
  List<AccountInfo> members;
  ChatifyMessage? nearestMessage;
  late String? title;

  Conversation({
    required this.id,
    required this.type,
    required this.members,
    this.nearestMessage,
    this.title,
  }) {
    title ??= getConversationTitle();
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
