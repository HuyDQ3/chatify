import 'package:equatable/equatable.dart';

import 'models.dart';
import 'package:chat_repository/chat_repository.dart' as chat_repository;

enum ConversationType {
  normal,
  favorite,
  banned,
}

class Conversation extends Equatable {
  final String id;
  ConversationType type;
  List<User> members;
  Messenger? nearestMessage;
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

  static Conversation chatRepositoryConversation(
      chat_repository.Conversation conversation) {
    return Conversation(
      id: conversation.id,
      type: chatRepositoryConversationType(conversation.type),
      members: chatRepositoryMember(conversation.members),
    );
  }

  static ConversationType chatRepositoryConversationType(
      chat_repository.ConversationType type) {
    if (ConversationType.values
        .any((element) => element.name.compareTo(type.name) == 0)) {
      return ConversationType.values
          .firstWhere((element) => element.name.compareTo(type.name) == 0);
    }
    return ConversationType.normal;
  }

  static List<User> chatRepositoryMember(List<chat_repository.User> members) {
    return List.generate(members.length,
        (index) => User.chatRepositoryUser(members.elementAt(index)));
  }

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
