import 'dart:async';

import 'models/models.dart';

class ChatRepository {
  final _messageStatus = StreamController<MessageStatus>();

  Stream<MessageStatus> get messageStatus async* {
    yield* _messageStatus.stream;
  }

  Conversation? currentConversation;

  Map<Conversation, List<Messenger>> _chat = {};

  Future<void> crawlChatTest() async {
    await Future.delayed(Duration(milliseconds: 350), () {
      if (_chat.isEmpty) {
        _chat = {
          Conversation.test1(): Messenger.getTest1Messengers(),
          Conversation.test2(): Messenger.getTest2Messengers(),
        };
      }
    },);
  }

  List<Conversation> get getAllConversations {
    return _chat.keys.toList();
  }

  Future<List<Messenger>> getMessagesFromConversation(Conversation conversation) async {
    List<Messenger> temp = [];
    if (_chat.containsKey(conversation)) {
      temp = List.from(_chat[conversation]!);
    }
    return temp;
  }

  Future<Map<Conversation, List<Messenger>>> getAllMessagesAndConversations() async {
    return Map.from(_chat);
  }

  Future<void> addMessageToChat(Messenger message) async {
    try {
      if (_chat.keys.any(
          (element) => element.id.compareTo(message.conversationId) == 0)) {
        var conversation = _chat.keys.firstWhere(
            (element) => element.id.compareTo(message.conversationId) == 0);
        await Future.delayed(
          Duration(milliseconds: 300),
          () async {
            _messageStatus.add(MessageStatus.send(
              message: message,
              conversation: conversation,
              sendMessageStatusType: SendMessageStatusType.initial,
            ));
            _messageStatus.add(MessageStatus.send(
              message: message,
              conversation: conversation,
              sendMessageStatusType: SendMessageStatusType.loading,
            ));
          },
        );
        _chat.update(
          conversation,
              (value) => [..._chat[conversation]!, message],
          ifAbsent: () => [message],
        );
        await Future.delayed(
          Duration(milliseconds: 300),
          () {
            _messageStatus.add(MessageStatus.send(
              message: message,
              conversation: conversation,
              sendMessageStatusType: SendMessageStatusType.success,
            ));
          },
        );
      } else {
        throw Exception();
      }
    } catch (e, s) {
      print("$e\n$s");
      _messageStatus.add(MessageStatus.send(
        message: message,
        sendMessageStatusType: SendMessageStatusType.failure,
      ));
    }
  }

  void dispose() => _messageStatus.close();
}
