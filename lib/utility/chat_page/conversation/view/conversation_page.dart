import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:flutter/material.dart';
import 'package:chatify/utility/chat_page/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart'
    as authentication_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

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
  late authentication_repository.AuthenticationRepository
      authenticationRepository;
  late user_repository.UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    chatRepository = context.read<chat_repository.ChatRepository>();
    authenticationRepository =
        context.read<authentication_repository.AuthenticationRepository>();
    userRepository = context.read<user_repository.UserRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversationBloc(
          chatRepository: chatRepository, userRepository: userRepository)
        ..add(ConversationStarted()),
      child: const ConversationForm(),
    );
    // return BlocProvider(
    //   create: (context) => LoginBloc(
    //       authenticationRepository: context.read<AuthenticationRepository>()),
    //   child: const ConversationForm(),
    // );
  }
}
