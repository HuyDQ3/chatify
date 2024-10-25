import 'package:chatify/constant/enum/bloc_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/res/button/chatify_elevated_button.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var accountController = TextEditingController();
  var passwordController = TextEditingController();
  LoginBloc? loginBloc;
  bool isLoginLoading = false;

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    loginBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 500,
            maxHeight: 750,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(TextConstant.login),
              const SizedBox(height: 8),
              TextFormField(
                controller: accountController,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
              ),
              const SizedBox(height: 8),
              BlocConsumer(
                bloc: loginBloc,
                builder: (context, state) {
                  if (state is ChatifyLoginState &&
                      state.status == BlocStatusType.loading) {
                    isLoginLoading = true;
                  } else {
                    isLoginLoading = false;
                  }
                  return ChatifyElevatedButton(
                    label: Text(TextConstant.login),
                    onPressed: () {
                      if (!isLoginLoading && formKey.currentState!.validate()) {
                        loginBloc?.add(ChatifyLoginEvent(
                            loginInfo: LoginInfo(
                          account: accountController.value.text,
                          password: passwordController.value.text,
                        )));
                      }
                    },
                    isLoading: isLoginLoading,
                  );
                },
                listener: (context, state) {
                  if (state is ChatifyLoginState && state.status == BlocStatusType.failure) {
                    var snackBar = SnackBar(content: Text(state.error ?? TextConstant.errorHappenedTryAgainLater));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
