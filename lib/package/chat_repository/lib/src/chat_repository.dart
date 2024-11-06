import 'dart:async';

import 'models/models.dart';

class ChatRepository {
  final _messageStatus = StreamController<MessageStatus>();

  Stream<MessageStatus> get messageStatus async* {
    // await Future<void>.delayed(const Duration(seconds: 1));
    yield* _messageStatus.stream;
  }

  Map<Conversation, List<Message>> conversations = {};

  Future<List<Conversation>> get getAllConversations async {
    return conversations.keys.toList();
  }

  Future<Map<Conversation, List<Message>>> getAllMessages(
      Conversation conversation) async {
    var map = Map<Conversation, List<Message>>.from(conversations)
      ..removeWhere((key, value) => key != conversation);
    return map;
  }

  Future<void> sendMessage(Message message) async {
    try {
      if (conversations.keys.any(
          (element) => element.id.compareTo(message.conversationId) == 0)) {
        var conversation = conversations.keys.firstWhere(
            (element) => element.id.compareTo(message.conversationId) == 0);
        await Future.delayed(
          Duration(milliseconds: 300),
          () async {
            _messageStatus.add(MessageStatus(
              message: message,
              conversation: conversation,
              sendingMessageStatusType: SendingMessageStatusType.initial,
            ));
            _messageStatus.add(MessageStatus(
              message: message,
              conversation: conversation,
              sendingMessageStatusType: SendingMessageStatusType.loading,
            ));
          },
        );
        conversations.update(
          conversation,
              (value) => [...conversations[conversation]!, message],
          ifAbsent: () => [message],
        );
        await Future.delayed(
          Duration(milliseconds: 300),
          () {
            _messageStatus.add(MessageStatus(
              message: message,
              conversation: conversation,
              sendingMessageStatusType: SendingMessageStatusType.success,
            ));
          },
        );
      } else {
        throw Exception();
      }
    } catch (e, s) {
      print("$e\n$s");
      _messageStatus.add(MessageStatus(
        message: message,
        sendingMessageStatusType: SendingMessageStatusType.failure,
      ));
    }
  }

  void dispose() => _messageStatus.close();
}
