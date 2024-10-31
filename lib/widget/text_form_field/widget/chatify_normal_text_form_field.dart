import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatifyNormalTextFormField extends StatefulWidget {
  const ChatifyNormalTextFormField({
    super.key,
    // this.title,
    // this.chatifyTextFormFieldBloc,
    // this.formKey,
    // this.controller,
    // this.focusNode,
    // this.obscureText,
    this.chatifyTextFormFieldSetting,
  });

  // final String? title;
  // final ChatifyTextFormFieldBloc? chatifyTextFormFieldBloc;
  final ChatifyTextFormFieldSetting? chatifyTextFormFieldSetting;
  // final GlobalKey<FormState>? formKey;
  // final InputBorder? inputBorder;
  // final InputDecoration? inputDecoration;
  // final TextEditingController? controller;
  // final FocusNode? focusNode;
  // final bool? obscureText;

  @override
  State<ChatifyNormalTextFormField> createState() =>
      _ChatifyNormalTextFormFieldState();
}

class _ChatifyNormalTextFormFieldState
    extends State<ChatifyNormalTextFormField> {
  // String? title;
  ChatifyTextFormFieldSetting? setting;
  ChatifyTextFormFieldBloc? bloc;
  GlobalKey<FormState>? formKey;
  InputDecoration? inputDecoration;
  // InputBorder? inputBorder;
  TextEditingController? controller;
  FocusNode? focusNode;
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    // title = widget.chatifyTextFormFieldSetting?.title;
    setting = widget.chatifyTextFormFieldSetting;
    if (setting?.bloc != null) {
      bloc = setting!.bloc;
    } else {
      bloc = ChatifyTextFormFieldBloc();
    }
    formKey = setting?.formKey;
    inputDecoration = setting?.inputDecoration;
    // inputBorder = setting?.inputBorder;
    controller = setting?.controller;
    focusNode = setting?.focusNode;
    obscureText = setting?.obscureText ?? false;
  }

  @override
  void dispose() {
    focusNode?.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatifyTextFormFieldBloc, ChatifyTextFormFieldState>(
      bloc: bloc,
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: inputDecoration,
          obscureText: obscureText,
        );
      },
    );
  }
}
