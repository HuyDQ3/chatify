import 'package:chat_repository/chat_repository.dart'
    as chat_repository;
import 'package:user_repository/user_repository.dart'
    as user_repository;
import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:chatify/utility/chat_page/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart'
    as authentication_repository;

import 'package:chatify/model/chat/models.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (context) => const ConversationForm(),
    );
  }
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    User? user;
    if (context.read<user_repository.UserRepository>().user != null) {
      user = User.fromUserRepositoryUser(
          context.read<user_repository.UserRepository>().user!);
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
              authenticationRepository: context
                  .read<authentication_repository.AuthenticationRepository>()),
        ),
        BlocProvider(
            create: (context) => ChatBloc(
                chatRepository: context.read<chat_repository.ChatRepository>())
              ..add(ChatCrawled(user))),
      ],
      child: const ConversationForm(),
    );
    // return BlocProvider(
    //   create: (context) => LoginBloc(
    //       authenticationRepository: context.read<AuthenticationRepository>()),
    //   child: const ConversationForm(),
    // );
  }
}
