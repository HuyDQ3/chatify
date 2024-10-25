import 'package:chatify/constant/enum/bloc_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/service/navigation/custom_navigation.dart';
import 'package:chatify/utility/begin/bloc/begin_bloc.dart';
import 'package:chatify/utility/begin/widget/splash_widget.dart';
import 'package:chatify/utility/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeginScreen extends StatefulWidget {
  const BeginScreen({super.key});

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  BeginBloc? beginBloc;

  @override
  void initState() {
    super.initState();
    beginBloc = BeginBloc();
    beginBloc?.add(SetUpResourceEvent());
  }

  @override
  void dispose() {
    beginBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: beginBloc,
        listener: (context, state) {
          if (state is SetUpResourceState && state.status == BlocStatusType.success) {
            customNavigator.push(context, const LoginScreen());
          }
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SplashWidget(),
            SizedBox(height: 8),
            Text(TextConstant.appName),
          ],
        ),
      ),
    );
  }
}
