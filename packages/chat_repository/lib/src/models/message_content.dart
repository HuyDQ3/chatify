class ChatRepositoryMessageContent {
  String? text;
  List<String>? imageLinks;
  List<String>? videoLinks;

  ChatRepositoryMessageContent({
    this.text,
    this.imageLinks,
    this.videoLinks,
  });

  ChatRepositoryMessageContent.text({this.text});

  ChatRepositoryMessageContent.images({this.imageLinks});

  ChatRepositoryMessageContent.videos({this.videoLinks});
}
