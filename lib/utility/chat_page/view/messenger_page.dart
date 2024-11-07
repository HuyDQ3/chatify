import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/chat_page/view/messenger_form.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

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
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
            value: context.read<chat_repository.ChatRepository>()),
        RepositoryProvider.value(
            value: context.read<user_repository.UserRepository>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<ChatBloc>()),
          BlocProvider.value(value: context.read<LoginBloc>()),
        ],
        child: const MessengerForm(),
      ),
    );
  }
}
