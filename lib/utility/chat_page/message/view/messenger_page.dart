import 'package:chatify/utility/chat_page/chat_page.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  State<MessengerPage> createState() => _MessengerPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (context) => const MessengerPage(),
    );
  }
}

class _MessengerPageState extends State<MessengerPage> {
  late chat_repository.ChatRepository chatRepository;
  // late authentication_repository.AuthenticationRepository authenticationRepository;
  late user_repository.UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    chatRepository = context.read<chat_repository.ChatRepository>();
    // authenticationRepository = context.read<authentication_repository.AuthenticationRepository>();
    userRepository = context.read<user_repository.UserRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MessageBloc(chatRepository: chatRepository, userRepository: userRepository)..add(MessageStarted())),
      ],
      child: const MessengerForm(),
    );

    // return MultiRepositoryProvider(
    //   providers: [
    //     RepositoryProvider.value(
    //         value: context.read<chat_repository.ChatRepository>()),
    //     RepositoryProvider.value(
    //         value: context.read<user_repository.UserRepository>()),
    //   ],
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider.value(value: context.read<ChatBloc>()),
    //       BlocProvider.value(value: context.read<LoginBloc>()),
    //     ],
    //     child: const MessengerForm(),
    //   ),
    // );
  }
}
