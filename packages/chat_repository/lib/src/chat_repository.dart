import 'dart:async';

import 'package:uuid/uuid.dart';

import 'models/models.dart';

class ChatRepository {
  final _receivedMessage = StreamController<ChatRepositoryMessage>();

  Stream<ChatRepositoryMessage> get receivedMessage async* {
    yield* _receivedMessage.stream;
  }

  Conversation? currentConversation;

  Map<Conversation, List<ChatRepositoryMessage>> _chat = {};

  Future<void> crawlChatTest(User user) async {
    await Future.delayed(
      const Duration(milliseconds: 350),
      () {
        if (_chat.isEmpty) {
          _chat = {
            Conversation.test1(): ChatRepositoryMessage.getTest1Messengers(),
            Conversation.test2(): ChatRepositoryMessage.getTest2Messengers(),
          };
        }
      },
    );
  }

  Future<List<Conversation>> getAllConversations() async {
    return await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        return _chat.keys.toList();
      },
    );
  }

  Future<List<ChatRepositoryMessage>> getMessages(
      Conversation conversation) async {
    List<ChatRepositoryMessage> temp = [];
    if (_chat.keys
        .any((element) => element.id.compareTo(conversation.id) == 0)) {
      var key = _chat.keys
          .firstWhere((element) => element.id.compareTo(conversation.id) == 0);
      temp = List.from(_chat[key]!);
    }
    return temp;
  }

  Future<List<ChatRepositoryMessage>?>
      getMessagesFromCurrentConversation() async {
    if (currentConversation != null) {
      return getMessages(currentConversation!);
    }
    return null;
  }

  Future<Map<Conversation, List<ChatRepositoryMessage>>>
      getAllMessagesAndConversations() async {
    return Map.from(_chat);
  }

  Future<void> sendMessage({
    required String senderId,
    required String conversationId,
    required ChatRepositoryMessageContent content,
  }) async {
    try {
      if (_chat.keys
          .any((element) => element.id.compareTo(conversationId) == 0)) {
        Conversation conversation = _chat.keys
            .firstWhere((element) => element.id.compareTo(conversationId) == 0);
        ChatRepositoryMessage message = ChatRepositoryMessage.success(
          id: Uuid().v4(),
          conversationId: conversationId,
          type: MessageType.text,
          senderId: senderId,
          content: content,
        );
        // await Future.delayed(
        //   Duration(milliseconds: 300),
        //   () async {
        //     _receivedMessage.add(MessageStatus.send(
        //       message: message,
        //       conversation: conversation,
        //       sendMessageStatusType: SendMessageStatusType.initial,
        //     ));
        //     _receivedMessage.add(MessageStatus.send(
        //       message: message,
        //       conversation: conversation,
        //       sendMessageStatusType: SendMessageStatusType.loading,
        //     ));
        //   },
        // );
        await Future.delayed(
          Duration(milliseconds: 300),
          () {
            _chat.update(
              conversation,
                  (value) => [..._chat[conversation]!, message],
              ifAbsent: () => [message],
            );
            _receivedMessage.add(message);
          },
        );
      } else {
        throw Exception();
      }
    } catch (e, s) {
      print("$e\n$s");
      // _receivedMessage.add(MessageStatus.send(
      //   message: message,
      //   sendMessageStatusType: SendMessageStatusType.failure,
      // ));
    }
  }

  void dispose() => _receivedMessage.close();
}
