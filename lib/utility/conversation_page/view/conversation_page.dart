import 'package:authentication_repository/authentication_repository.dart';
import 'package:chatify/utility/conversation_page/view/conversation_form.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ConversationPage());
  }
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
        ),
      ],
      child: const ConversationForm(),
    );
  }
}
