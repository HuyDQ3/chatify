import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/utility/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var formKey = GlobalKey<FormState>();
  var accountController = TextEditingController(text: "huy");
  var passwordController = TextEditingController(text: "huy123");
  var isShowPassword = ValueNotifier<bool>(false);
  var isLoginLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status.isFailure) {
              var snackBar = const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(TextConstant.errorHappenedTryAgainLater));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar(reason: SnackBarClosedReason.action)
                ..showSnackBar(snackBar);
            }
          },
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Flexible(child: Text(TextConstant.login)),
                        Text(TextConstant.login),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _UsernameInput(),
                            SizedBox(height: 16),
                            _PasswordInput(),
                          ],
                        ),
                        // Expanded(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       _UsernameInput(),
                        //       SizedBox(height: 16),
                        //       _PasswordInput(),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _LoginButton(),
                  SizedBox(height: 16),
                  _RegisterTitle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Widget old() {
//   return Scaffold(
//     body: Center(
//       child: Form(
//         key: formKey,
//         child: Container(
//           constraints: const BoxConstraints(
//             maxWidth: 500,
//             maxHeight: 500,
//           ),
//           decoration: BoxDecoration(border: Border.all()),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const Flexible(child: Text(TextConstant.login)),
//                       Flexible(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextFormField(
//                               controller: accountController,
//                               validator:
//                                   AccountValidation.accountLoginValidation,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 labelText: TextConstant.account,
//                               ),
//                             ),
//                             // ChatifyTextFormField(
//                             //   setting: ChatifyTextFormFieldSetting(
//                             //     TextFormFieldSettingType.account,
//                             //     controller: accountController,
//                             //   ),
//                             // ),
//                             const SizedBox(height: 16),
//                             ValueListenableBuilder(
//                               valueListenable: isShowPassword,
//                               builder: (context, value, child) {
//                                 Widget suffix;
//                                 if (value) {
//                                   suffix = const Icon(Icons.visibility);
//                                 } else {
//                                   suffix = const Icon(Icons.visibility_off);
//                                 }
//                                 return TextFormField(
//                                   controller: passwordController,
//                                   validator: AccountValidation
//                                       .passwordLoginValidation,
//                                   decoration: InputDecoration(
//                                     border: const OutlineInputBorder(),
//                                     labelText: TextConstant.password,
//                                     suffixIcon: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             isShowPassword.value = !value;
//                                           },
//                                           borderRadius:
//                                               BorderRadius.circular(24),
//                                           child: SizedBox(
//                                             width: 36,
//                                             height: 36,
//                                             child: suffix,
//                                           ),
//                                         ),
//                                         // Padding(
//                                         //   padding: const EdgeInsets.only(right: 4),
//                                         //   // child: InkWell(
//                                         //   //   // borderRadius: BorderRadius.circular(24),
//                                         //   //   onTap: () {
//                                         //   //     isShowPassword.value = !value;
//                                         //   //   },
//                                         //   //   child: suffix,
//                                         //   // ),
//                                         // ),
//                                       ],
//                                     ),
//                                   ),
//                                   obscureText: !value,
//                                 );
//                               },
//                             ),
//                             const SizedBox(height: 16),
//                             BlocConsumer(
//                               bloc: loginBloc,
//                               listener: (context, state) {
//                                 if (state is ChatifyLoginState &&
//                                     state.status == BlocStatusType.failure) {
//                                   var snackBar = SnackBar(
//                                       duration: const Duration(seconds: 1),
//                                       content: Text(state.error ??
//                                           TextConstant
//                                               .errorHappenedTryAgainLater));
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(snackBar);
//                                 }
//                                 if (state is ChatifyLoginState &&
//                                     state.status == BlocStatusType.success) {
//                                   customNavigator.push(
//                                     context,
//                                     const HomePageScreen(),
//                                   );
//                                 }
//                               },
//                               builder: (context, state) {
//                                 Widget loginIcon;
//                                 if (state is ChatifyLoginState &&
//                                     state.status == BlocStatusType.loading) {
//                                   isLoginLoading = true;
//                                   loginIcon = Transform.scale(
//                                       scale: .5,
//                                       child:
//                                           const CircularProgressIndicator());
//                                 } else {
//                                   isLoginLoading = false;
//                                   loginIcon = const Icon(Icons.login);
//                                 }
//                                 return Material(
//                                   color: Colors.transparent,
//                                   shape:
//                                       const CircleBorder(side: BorderSide()),
//                                   child: InkWell(
//                                     customBorder: const CircleBorder(),
//                                     onTap: () {
//                                       if (!isLoginLoading &&
//                                           formKey.currentState!.validate()) {
//                                         loginBloc?.add(ChatifyLoginEvent(
//                                             loginInfo: LoginInfo(
//                                           account:
//                                               accountController.value.text,
//                                           password:
//                                               passwordController.value.text,
//                                         )));
//                                       }
//                                     },
//                                     child: Container(
//                                       width: 60,
//                                       height: 60,
//                                       decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           border: Border()),
//                                       child: loginIcon,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(TextConstant.needToRegisterAnAccount),
//                     const SizedBox(width: 8),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text(TextConstant.register),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final displayError = context
        .select((LoginBloc bloc) => bloc.state.username.displayError);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: TextConstant.account,
        errorText: displayError != null ? TextConstant.emptyAccount : null,
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(LoginUsernameChanged(value));
      },
    );

    // TextFormField(
    //   controller: accountController,
    //   // validator:
    //   //     AccountValidation.accountLoginValidation,
    //   decoration: const InputDecoration(
    //     border: OutlineInputBorder(),
    //     labelText: TextConstant.account,
    //   ),
    // ),
    // ChatifyTextFormField(
    //   setting: ChatifyTextFormFieldSetting(
    //     TextFormFieldSettingType.account,
    //     controller: accountController,
    //   ),
    // ),
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final displayError = context
        .select((LoginBloc bloc) => bloc.state.password.displayError);
    final isPasswordShow =
    context.select((LoginBloc bloc) => bloc.state.isPasswordShow);

    Widget suffix;
    bool obscureText;
    if (isPasswordShow) {
      suffix = const Icon(Icons.visibility_off);
      obscureText = false;
    } else {
      suffix = const Icon(Icons.visibility);
      obscureText = true;
    }

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: TextConstant.password,
        errorText: displayError != null ? TextConstant.emptyPassword : null,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                if (isPasswordShow) {
                  context
                      .read<LoginBloc>()
                      .add(LoginPasswordTextFieldShowed());
                } else {
                  context
                      .read<LoginBloc>()
                      .add(LoginPasswordTextFieldHided());
                }
              },
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
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
      onChanged: (value) {
        context.read<LoginBloc>().add(LoginPasswordChanged(value));
      },
      obscureText: obscureText,
    );

    return Builder(
      builder: (context) {
        final isPasswordShow =
            context.select((LoginBloc bloc) => bloc.state.isPasswordShow);
        Widget suffix;
        bool obscureText;
        if (isPasswordShow) {
          suffix = const Icon(Icons.visibility_off);
          obscureText = false;
        } else {
          suffix = const Icon(Icons.visibility);
          obscureText = true;
        }

        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: TextConstant.password,
            errorText: displayError != null ? TextConstant.emptyPassword : null,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    if (isPasswordShow) {
                      context
                          .read<LoginBloc>()
                          .add(LoginPasswordTextFieldShowed());
                    } else {
                      context
                          .read<LoginBloc>()
                          .add(LoginPasswordTextFieldHided());
                    }
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
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
          obscureText: obscureText,
        );
      },
    );

    return const Placeholder();
    // ValueListenableBuilder(
    //   valueListenable: isShowPassword,
    //   builder: (context, value, child) {
    //     Widget suffix;
    //     if (value) {
    //       suffix = const Icon(Icons.visibility);
    //     } else {
    //       suffix = const Icon(Icons.visibility_off);
    //     }
    //     return TextFormField(
    //       controller: passwordController,
    //       // validator:
    //       //     AccountValidation.passwordLoginValidation,
    //       decoration: InputDecoration(
    //         border: const OutlineInputBorder(),
    //         labelText: TextConstant.password,
    //         suffixIcon: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 isShowPassword.value = !value;
    //               },
    //               borderRadius:
    //               BorderRadius.circular(24),
    //               child: SizedBox(
    //                 width: 36,
    //                 height: 36,
    //                 child: suffix,
    //               ),
    //             ),
    //             // Padding(
    //             //   padding: const EdgeInsets.only(right: 4),
    //             //   // child: InkWell(
    //             //   //   // borderRadius: BorderRadius.circular(24),
    //             //   //   onTap: () {
    //             //   //     isShowPassword.value = !value;
    //             //   //   },
    //             //   //   child: suffix,
    //             //   // ),
    //             // ),
    //           ],
    //         ),
    //       ),
    //       obscureText: !value,
    //     );
    //   },
    // ),
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isInProcessOrSuccess = context.select(
            (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess);
        final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
        Widget loginIcon;
        void Function()? login;

        if (isInProcessOrSuccess) {
          loginIcon = Transform.scale(
            scale: .5,
            child: const CircularProgressIndicator(),
          );
          login = null;
        } else {
          loginIcon = const Icon(Icons.login);
          login = () {
            if (isValid) {
              context.read<LoginBloc>().add(LoginSubmitted());
            }
          };
        }

        // if (state is ChatifyLoginState &&
        //     state.status == BlocStatusType.loading) {
        //   isLoginLoading = true;
        //   loginIcon = Transform.scale(
        //       scale: .5,
        //       child: const CircularProgressIndicator());
        // } else {
        //   isLoginLoading = false;
        //   loginIcon = const Icon(Icons.login);
        // }

        return Material(
          color: Colors.transparent,
          shape: const CircleBorder(side: BorderSide()),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: login,
            // onTap: () {
            //   if (!isLoginLoading &&
            //       formKey.currentState!.validate()) {
            //     loginBloc?.add(ChatifyLoginEvent(
            //         loginInfo: LoginInfo(
            //           account: accountController.value.text,
            //           password:
            //           passwordController.value.text,
            //         )));
            //   }
            // },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: Border(),
              ),
              child: loginIcon,
            ),
          ),
        );
      },
    );
    return const Placeholder();
    // BlocConsumer(
    //   bloc: loginBloc,
    //   listener: (context, state) {
    //     if (state is ChatifyLoginState &&
    //         state.status == BlocStatusType.failure) {
    //       var snackBar = SnackBar(
    //           duration: const Duration(seconds: 1),
    //           content: Text(state.error ??
    //               TextConstant
    //                   .errorHappenedTryAgainLater));
    //       ScaffoldMessenger.of(context)
    //           .showSnackBar(snackBar);
    //     }
    //     if (state is ChatifyLoginState &&
    //         state.status == BlocStatusType.success) {
    //       customNavigator.push(
    //         context,
    //         const HomePageScreen(),
    //       );
    //     }
    //   },
    //   builder: (context, state) {
    //     Widget loginIcon;
    //     if (state is ChatifyLoginState &&
    //         state.status == BlocStatusType.loading) {
    //       isLoginLoading = true;
    //       loginIcon = Transform.scale(
    //           scale: .5,
    //           child: const CircularProgressIndicator());
    //     } else {
    //       isLoginLoading = false;
    //       loginIcon = const Icon(Icons.login);
    //     }
    //     return Material(
    //       color: Colors.transparent,
    //       shape: const CircleBorder(side: BorderSide()),
    //       child: InkWell(
    //         customBorder: const CircleBorder(),
    //         onTap: () {
    //           if (!isLoginLoading &&
    //               formKey.currentState!.validate()) {
    //             loginBloc?.add(ChatifyLoginEvent(
    //                 loginInfo: LoginInfo(
    //                   account: accountController.value.text,
    //                   password:
    //                   passwordController.value.text,
    //                 )));
    //           }
    //         },
    //         child: Container(
    //           width: 60,
    //           height: 60,
    //           decoration: const BoxDecoration(
    //               shape: BoxShape.circle,
    //               border: Border()),
    //           child: loginIcon,
    //         ),
    //       ),
    //     );
    //   },
    // ),
  }
}

class _RegisterTitle extends StatelessWidget {
  const _RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(TextConstant.needToRegisterAnAccount),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          child: const Text(TextConstant.register),
        ),
      ],
    );
  }
}
