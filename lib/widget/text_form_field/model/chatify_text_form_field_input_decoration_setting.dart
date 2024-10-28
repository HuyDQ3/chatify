import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldInputDecorationSetting {
  final InputDecorationType inputDecorationType;
  String? id;
  InputBorder? border;
  Widget? prefix, suffix;
  Icon? prefixIcon, suffixIcon;
  String? labelText;

  ChatifyTextFormFieldInputDecorationSetting(
    this.inputDecorationType, {
    this.id,
    this.border,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.labelText,
  });

  InputDecoration get inputDecoration => InputDecoration(
        border: border,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
        labelText: labelText,
      );

  static ChatifyTextFormFieldInputDecorationSetting account(
          {ChatifyTextFormFieldBloc? bloc}) =>
      ChatifyTextFormFieldInputDecorationSetting(
        InputDecorationType.account,
        prefixIcon: const Icon(Icons.account_box),
        labelText: TextConstant.account,
      );

  static ChatifyTextFormFieldInputDecorationSetting hidePassword(
      {ChatifyTextFormFieldBloc? bloc}) {
    return ChatifyTextFormFieldInputDecorationSetting(
      InputDecorationType.hidePassword,
      labelText: TextConstant.password,
      prefixIcon: const Icon(Icons.password),
      suffix: IconButton(
        icon: const Icon(Icons.visibility_off),
        splashRadius: 24,
        onPressed: () {
          bloc?.add(ChangeSettingEvent(
              setting: ChatifyTextFormFieldSetting.showPassword(bloc: bloc)));
        },
      ),
    );
  }

  static ChatifyTextFormFieldInputDecorationSetting showPassword(
      {ChatifyTextFormFieldBloc? bloc}) {
    return ChatifyTextFormFieldInputDecorationSetting(
      InputDecorationType.showPassword,
      labelText: TextConstant.password,
      prefixIcon: const Icon(Icons.password),
      suffix: IconButton(
        icon: const Icon(Icons.visibility),
        splashRadius: 24,
        onPressed: () {
          bloc?.add(ChangeSettingEvent(
              setting: ChatifyTextFormFieldSetting.hidePassword(bloc: bloc)));
        },
      ),
    );
  }

  static Map<InputDecorationType, ChatifyTextFormFieldInputDecorationSetting>
      values(ChatifyTextFormFieldBloc? bloc) {
    return {
      InputDecorationType.account:
          ChatifyTextFormFieldInputDecorationSetting.account(bloc: bloc),
      InputDecorationType.showPassword:
          ChatifyTextFormFieldInputDecorationSetting.showPassword(bloc: bloc),
      InputDecorationType.hidePassword:
          ChatifyTextFormFieldInputDecorationSetting.hidePassword(bloc: bloc),
    };
  }
}
