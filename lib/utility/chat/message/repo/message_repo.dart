import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/chatify_conversation.dart';
import 'package:chatify/model/chat/chatify_message.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/utility/chat/conversation/repo/chat_repo.dart';

class MessageRepo {
  ChatifyConversation? chatifyConversation;

  Future<List<ChatifyMessage>> getMessage(String conversationId) async {
    return await ChatRepo.getMessagesInConversation(conversationId);
  }

  Future<void> sendMessage(ChatifySendMessage message) async {
    try {
      if (chatifyConversation != null) {
        await ChatRepo.sendMessage(chatifyConversation!.id, message);
        // if (chatifyMessage != null) {
        //   // chatifyConversation!.messages.add(chatifyMessage);
        // }
      } else {
        throw Exception(TextConstant.conversationModelIsNull);
      }
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      rethrow;
    }
  }
}
