import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:chatify/utility/chat_page/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart'
    as authentication_repository;

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
  late chat_repository.ChatRepository chatRepository;
  late authentication_repository.AuthenticationRepository authenticationRepository;

  @override
  void initState() {
    super.initState();
    chatRepository = context.read<chat_repository.ChatRepository>();
    authenticationRepository = context.read<authentication_repository.AuthenticationRepository>();
  }

  @override
  Widget build(BuildContext context) {
    // User? user;
    // if (context.read<user_repository.UserRepository>().user != null) {
    //   user = User.fromUserRepositoryUser(
    //       context.read<user_repository.UserRepository>().user!);
    // }

    // return const ConversationForm();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
              authenticationRepository: authenticationRepository),
        ),
        BlocProvider(
            create: (context) => ChatBloc(chatRepository: chatRepository)),
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
