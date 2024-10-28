import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatifyTextFormField extends StatefulWidget {
  const ChatifyTextFormField({super.key, required this.setting});

  final ChatifyTextFormFieldSetting setting;

  @override
  State<ChatifyTextFormField> createState() => _ChatifyTextFormFieldState();
}

class _ChatifyTextFormFieldState extends State<ChatifyTextFormField> {
  ChatifyTextFormFieldSetting? setting;
  ChatifyTextFormFieldBloc? bloc;

  @override
  void initState() {
    super.initState();
    setting = widget.setting;
    bloc = widget.setting.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatifyTextFormFieldBloc, ChatifyTextFormFieldState>(
      bloc: bloc,
      buildWhen: (previous, current) {
        return [
          TextFormFieldSettingType.showPassword,
          TextFormFieldSettingType.hidePassword,
        ].any((element) => element == setting?.settingType);
      },
      builder: (context, state) {
        if (state is ChangeSettingState &&
            state.status == BlocStatusType.success &&
            state.setting != null) {
          setting = state.setting!;
        } else if (state is ChangeInputBorderSettingState &&
            state.status == BlocStatusType.success &&
            state.setting != null) {
          setting?.inputBorderSetting = state.setting;
        } else if (state is ChangeInputDecorationSettingState &&
            state.status == BlocStatusType.success &&
            state.setting != null) {
          setting?.inputDecorationSetting = state.setting;
        }
        setting?.obscureTextTrigger();
        return TextFormField(
          controller: setting?.controller,
          decoration: setting?.inputDecorationSetting?.inputDecoration,
          obscureText: setting?.obscureText ?? false,
        );
      },
    );
  }
}
