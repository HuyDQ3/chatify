import 'package:authentication_repository/authentication_repository.dart';
import 'package:chatify/utility/login/login.dart';
import 'package:chatify/utility/setting_page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingPage());
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          authenticationRepository: context.read<AuthenticationRepository>()),
      child: const SettingForm(),
    );
  }
}
