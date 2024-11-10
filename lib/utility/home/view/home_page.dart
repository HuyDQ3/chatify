import 'package:chatify/utility/home/home.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;
import 'package:chat_repository/chat_repository.dart' as chat_repository;

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
    return const HomeForm();
    // return MultiRepositoryProvider(
    //   providers: [
    //     RepositoryProvider(create: (context) => context.read<chat_repository.ChatRepository>()),
    //     RepositoryProvider(
    //         create: (context) => context.read<authentication_repository.AuthenticationRepository>),
    //   ],
    //   child: MultiBlocProvider(providers: [
    //     BlocProvider(
    //       create: (context) => LoginBloc(
    //           authenticationRepository: context
    //               .read<authentication_repository.AuthenticationRepository>()),
    //     ),
    //     BlocProvider(
    //         create: (context) => ChatBloc(
    //             chatRepository: context.read<chat_repository.ChatRepository>())),
    //   ], child: const HomeForm(),),
    // );
  }
}
