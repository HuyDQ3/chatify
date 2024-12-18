import 'package:chatify/utility/home/home.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;
import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const HomePage());
  }
}

class _HomePageState extends State<HomePage> {
  late authentication_repository.AuthenticationRepository authenticationRepository;
  late chat_repository.ChatRepository chatRepository;
  late user_repository.UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    authenticationRepository = context.read<authentication_repository.AuthenticationRepository>();
    chatRepository = context.read<chat_repository.ChatRepository>();
    userRepository = context.read<user_repository.UserRepository>();
  }

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
