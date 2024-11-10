import 'package:equatable/equatable.dart';

import 'models.dart';

enum ConversationType {
  normal,
  favorite,
  banned,
}

class Conversation extends Equatable {
  final String id;
  ConversationType type;
  List<User> members;
  ChatRepositoryMessage? nearestMessage;
  String? title;

  Conversation({
    required this.id,
    required this.type,
    required this.members,
    this.nearestMessage,
    this.title,
  }) {
    title ??= getConversationTitle();
  }

  Conversation.test1()
      : id = "conv1",
        title = "mwhahaha",
        type = ConversationType.normal,
        members = <User>[
          User.huy(),
          User.nghia(),
        ];

  Conversation.test2()
      : id = "conv2",
        type = ConversationType.normal,
        members = <User>[
          User.huy(),
          User.nghia(),
        ];

  @override
  List<Object?> get props => [id, type, members, nearestMessage, title];

  String getConversationTitle() {
    // String temp = TextConstant.conversation;
    String temp = "$id - $type";
    // List<String> memberNames = [];
    // members.removeWhere((element) =>
    // AccountInfo.currentLoginAccount
    //     ?.isCurrentLoginAccount(element.personalInfo.id) ??
    //     false);
    // for (var member in members) {
    //   if (member.personalInfo.name != null) {
    //     memberNames.add(member.personalInfo.name!);
    //   }
    // }
    // if (memberNames.isNotEmpty) {
    //   temp = memberNames.join(", ");
    // }
    return temp;
  }
}
