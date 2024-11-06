import 'package:chatify/utility/login/login.dart';
import 'package:flutter/material.dart';
import 'package:chatify/utility/chat_page/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const ConversationForm(),);
  }
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authenticationRepository: context.read<AuthenticationRepository>()),
      child: const ConversationForm(),
    );
  }
}
