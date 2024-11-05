import 'package:chatify/package/authentication_repository/lib/authentication_repository.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:chatify/utility/login/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => LoginBloc(authenticationRepository: context.read<AuthenticationRepository>()),
      child: const LoginForm(),
    );
  }
}
