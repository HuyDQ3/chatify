import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/service/navigation/custom_navigation.dart';
import 'package:chatify/utility/home_page/screen/home_page_screen.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:chatify/validation/account_validation.dart';
import 'package:chatify/widget/button/chatify_elevated_button.dart';
import 'package:chatify/widget/button/chatify_text_button.dart';
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
  var isShowPassword = ValueNotifier<bool>(false);

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
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 500,
            ),
            decoration: BoxDecoration(border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Flexible(child: Text(TextConstant.login)),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: accountController,
                                validator:
                                    AccountValidation.accountLoginValidation,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: TextConstant.account,
                                ),
                              ),
                              // ChatifyTextFormField(
                              //   setting: ChatifyTextFormFieldSetting(
                              //     TextFormFieldSettingType.account,
                              //     controller: accountController,
                              //   ),
                              // ),
                              const SizedBox(height: 16),
                              ValueListenableBuilder(
                                valueListenable: isShowPassword,
                                builder: (context, value, child) {
                                  Widget suffix;
                                  if (value) {
                                    suffix = const Icon(Icons.visibility);
                                  } else {
                                    suffix = const Icon(Icons.visibility_off);
                                  }
                                  return TextFormField(
                                    controller: passwordController,
                                    validator: AccountValidation
                                        .passwordLoginValidation,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: TextConstant.password,
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              isShowPassword.value = !value;
                                            },
                                            borderRadius: BorderRadius.circular(24),
                                            child: Container(
                                              width: 36,
                                              height: 36,
                                              child: suffix,
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 4),
                                          //   // child: InkWell(
                                          //   //   // borderRadius: BorderRadius.circular(24),
                                          //   //   onTap: () {
                                          //   //     isShowPassword.value = !value;
                                          //   //   },
                                          //   //   child: suffix,
                                          //   // ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    obscureText: !value,
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              BlocConsumer(
                                bloc: loginBloc,
                                listener: (context, state) {
                                  if (state is ChatifyLoginState &&
                                      state.status == BlocStatusType.failure) {
                                    var snackBar = SnackBar(
                                        duration: const Duration(seconds: 1),
                                        content: Text(state.error ??
                                            TextConstant
                                                .errorHappenedTryAgainLater));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  if (state is ChatifyLoginState &&
                                      state.status == BlocStatusType.success) {
                                    customNavigator.push(
                                      context,
                                      const HomePageScreen(),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  Widget loginIcon;
                                  if (state is ChatifyLoginState &&
                                      state.status == BlocStatusType.loading) {
                                    isLoginLoading = true;
                                    loginIcon = Transform.scale(scale: .5, child: const CircularProgressIndicator());
                                  } else {
                                    isLoginLoading = false;
                                    loginIcon = const Icon(Icons.login);
                                  }
                                  return Material(
                                    color: Colors.transparent,
                                    shape: const CircleBorder(
                                      side: BorderSide()
                                    ),
                                    child: InkWell(
                                      customBorder: const CircleBorder(
                                      ),
                                      onTap: () {
                                        if (!isLoginLoading &&
                                            formKey.currentState!.validate()) {
                                          loginBloc?.add(ChatifyLoginEvent(
                                              loginInfo: LoginInfo(
                                            account:
                                                accountController.value.text,
                                            password:
                                                passwordController.value.text,
                                          )));
                                        }
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border()
                                        ),
                                        child: loginIcon,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(TextConstant.needToRegisterAnAccount),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text(TextConstant.register),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
