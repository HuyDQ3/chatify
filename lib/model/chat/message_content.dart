import 'package:chat_repository/chat_repository.dart';

class MessageContent {
  String? text;
  List<String>? imageLinks;
  List<String>? videoLinks;

  MessageContent({
    this.text,
    this.imageLinks,
    this.videoLinks,
  });

  MessageContent.text({this.text});

  MessageContent.images({this.imageLinks});

  MessageContent.videos({this.videoLinks});

  static ChatRepositoryMessageContent toChatRepositoryMessageContent(MessageContent content) {
    return ChatRepositoryMessageContent(
      text: content.text,
      imageLinks: content.imageLinks,
      videoLinks: content.videoLinks,
    );
  }

  static MessageContent fromChatRepositoryMessageContent(ChatRepositoryMessageContent content) {
    return MessageContent(
      text: content.text,
      imageLinks: content.imageLinks,
      videoLinks: content.videoLinks,
    );
  }
}
