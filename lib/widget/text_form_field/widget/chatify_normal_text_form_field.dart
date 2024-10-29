import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatifyNormalTextFormField extends StatefulWidget {
  const ChatifyNormalTextFormField({
    super.key,
    this.title,
    this.chatifyTextFormFieldBloc,
    this.chatifyTextFormFieldSetting,
  });

  final String? title;
  final ChatifyTextFormFieldBloc? chatifyTextFormFieldBloc;
  final ChatifyTextFormFieldSetting? chatifyTextFormFieldSetting;

  @override
  State<ChatifyNormalTextFormField> createState() =>
      _ChatifyNormalTextFormFieldState();
}

class _ChatifyNormalTextFormFieldState
    extends State<ChatifyNormalTextFormField> {
  String? title;
  ChatifyTextFormFieldBloc? bloc;
  ChatifyTextFormFieldSetting? setting;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    if (widget.chatifyTextFormFieldBloc != null) {
      bloc = widget.chatifyTextFormFieldBloc;
    } else {
      bloc = ChatifyTextFormFieldBloc();
    }
    setting = widget.chatifyTextFormFieldSetting;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatifyTextFormFieldBloc, ChatifyTextFormFieldState>(
      bloc: bloc,
      builder: (context, state) {
        return TextFormField(
          controller: ,
        );
      },
    );
  }
}
