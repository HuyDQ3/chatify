import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:chat_repository/chat_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const HomePage());
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => context.read<ChatRepository>()),
        RepositoryProvider(
            create: (context) => context.read<AuthenticationRepository>),
      ],
      child: const HomeForm(),
    );
  }
}
