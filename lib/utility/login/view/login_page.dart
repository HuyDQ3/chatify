import 'package:chatify/utility/chat_page/bloc/chat_bloc.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:chatify/utility/login/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;
import 'package:chat_repository/chat_repository.dart' as chat_repository;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository: context.read<authentication_repository.AuthenticationRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ChatBloc(
            chatRepository: context.read<chat_repository.ChatRepository>(),
          ),
        ),
      ],
      child: const LoginForm(),
    );
  }
}
