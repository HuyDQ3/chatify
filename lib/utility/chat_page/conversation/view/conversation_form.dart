import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/chat/models.dart';
import 'package:chatify/service/navigation/custom_navigation.dart';
import 'package:chatify/utility/chat_page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationForm extends StatefulWidget {
  const ConversationForm({super.key});

  @override
  State<ConversationForm> createState() => _ConversationFormState();

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ConversationForm());
  }
}

class _ConversationFormState extends State<ConversationForm> {
  late ConversationBloc conversationBloc;

  @override
  void initState() {
    super.initState();
    conversationBloc = context.read<ConversationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstant.chat),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<ConversationBloc, ConversationState>(
        listener: (context, state) async {
          if (state is ConversationTappedSuccess) {
            customNavigator.push(context, const MessengerPage());
          }
        },
        buildWhen: (previous, current) {
          return current is ConversationLoadSuccess || current is ConversationLoadFailure;
        },
        builder: (context, state) {
          if (state is ConversationLoadSuccess) {
            return conversations(state.conversations);
          }
          if (state is ConversationLoadFailure) {
            return failureConversationWidget();
          }
          return loadingConversationWidget();
        },
      ),
    );
  }

  Widget conversations(List<Conversation>? items) {
    if (items == null || items.isEmpty) {
      return emptyConversationWidget();
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return conversationItem(items[index]);
      },
    );
  }

  Widget loadingConversationWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // width: 64,
            // height: 64,
            // padding: const EdgeInsets.all(4),
            child: const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox.square(dimension: 8),
          TextButton(
            onPressed: () {
              conversationBloc.add(ConversationStarted());
            },
            child: const Text(TextConstant.tryAgain),
          ),
        ],
      ),
    );

    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget failureConversationWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, size: 48),
          const SizedBox.square(dimension: 8),
          const Text(
            TextConstant.errorHappenedTryAgainLater,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox.square(dimension: 8),
          TextButton(
            onPressed: () {
              conversationBloc.add(ConversationStarted());
            },
            child: const Text(TextConstant.tryAgain),
          ),
        ],
      ),
    );
  }

  Widget emptyConversationWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.message, size: 48),
          const SizedBox.square(dimension: 8),
          const Text(
            TextConstant.emptyConversation,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox.square(dimension: 8),
          TextButton(
            onPressed: () {
              conversationBloc.add(ConversationStarted());
            },
            child: const Text(TextConstant.tryAgain),
          ),
        ],
      ),
    );
  }

  Widget loadingMessageWidget() {
    return const CircularProgressIndicator();
  }

  Widget conversationItem(Conversation item) {
    Widget leading = const CircleAvatar(child: Icon(Icons.person));
    String title;
    if (item.title != null) {
      title = item.title!;
    } else {
      List<String> memberNames = [];
      for (var member in item.members) {
        if (member.personalInfo.name != null) {
          memberNames.add(member.personalInfo.name!);
        }
      }
      if (memberNames.isNotEmpty) {
        title = memberNames.join(", ");
      } else {
        title = "";
      }
    }
    return ListTile(
      onTap: () {
        conversationBloc.add(ConversationTapped(item));
      },
      leading: leading,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item.nearestMessage?.content.text ?? "",
        // item.messages.isNotEmpty ? item.messages.last.text ?? "" : "",
        overflow: TextOverflow.ellipsis,
      ),
      // trailing: SizedBox.square(
      //   dimension: 24,
      //   child: BlocBuilder<ChatBloc, ChatState>(
      //     buildWhen: (previous, current) {
      //       return current is ConversationCrawlInProgress ||
      //           previous is ConversationCrawlInProgress;
      //     },
      //     builder: (context, state) {
      //       if (state is ConversationCrawlInProgress) {
      //         return loadingMessageWidget();
      //       }
      //       // if (state is GoToMessageScreenState &&
      //       //     state.type == BlocStatusType.loading &&
      //       //     state.conversationId?.compareTo(item.id) == 0) {
      //       //   return loadingMessageWidget();
      //       // }
      //       return Container();
      //     },
      //   ),
      // ),
    );
  }
}
