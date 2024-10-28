import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_border_setting.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_decoration_setting.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldSetting {
  TextFormFieldSettingType settingType;
  String? id;
  ChatifyTextFormFieldBloc? bloc;
  ChatifyTextFormFieldInputBorderSetting? inputBorderSetting;
  ChatifyTextFormFieldInputDecorationSetting? inputDecorationSetting;
  bool? obscureText;
  TextEditingController? controller;

  ChatifyTextFormFieldSetting(
    this.settingType, {
    this.id,
    this.controller,
    this.bloc,
    this.inputBorderSetting,
  }) {
    inputDecorationSettingTrigger();
  }

  void inputDecorationSettingTrigger() {
    blocTrigger();
    switch (settingType) {
      case TextFormFieldSettingType.account:
        inputDecorationSetting =
            ChatifyTextFormFieldInputDecorationSetting.account(bloc: bloc);
      case TextFormFieldSettingType.showPassword:
        inputDecorationSetting =
            ChatifyTextFormFieldInputDecorationSetting.showPassword(bloc: bloc);
      case TextFormFieldSettingType.hidePassword:
        inputDecorationSetting =
            ChatifyTextFormFieldInputDecorationSetting.hidePassword(bloc: bloc);
    }
    inputBorderTrigger();
    obscureTextTrigger();
  }

  void blocTrigger() {
    bloc ??= ChatifyTextFormFieldBloc();
  }

  void inputBorderTrigger() {
    inputBorderSetting ??= ChatifyTextFormFieldInputBorderSetting.normal;
    inputDecorationSetting?.border = inputBorderSetting?.inputBorder;
  }

  void obscureTextTrigger() {
    if (inputDecorationSetting?.inputDecorationType ==
        InputDecorationType.hidePassword) {
      obscureText = true;
    } else {
      obscureText = false;
    }
  }

  static ChatifyTextFormFieldSetting account({
    ChatifyTextFormFieldBloc? bloc,
    ChatifyTextFormFieldInputBorderSetting? inputBorder,
  }) {
    return ChatifyTextFormFieldSetting(
      TextFormFieldSettingType.account,
      bloc: bloc,
      inputBorderSetting:
          inputBorder ?? ChatifyTextFormFieldInputBorderSetting.normal,
    );
  }

  static ChatifyTextFormFieldSetting hidePassword({
    ChatifyTextFormFieldBloc? bloc,
    ChatifyTextFormFieldInputBorderSetting? inputBorder,
  }) {
    return ChatifyTextFormFieldSetting(
      TextFormFieldSettingType.hidePassword,
      bloc: bloc,
      inputBorderSetting:
          inputBorder ?? ChatifyTextFormFieldInputBorderSetting.normal,
    );
  }

  static ChatifyTextFormFieldSetting showPassword({
    ChatifyTextFormFieldBloc? bloc,
    ChatifyTextFormFieldInputBorderSetting? inputBorder,
  }) {
    return ChatifyTextFormFieldSetting(
      TextFormFieldSettingType.showPassword,
      bloc: bloc,
      inputBorderSetting:
          inputBorder ?? ChatifyTextFormFieldInputBorderSetting.normal,
    );
  }

  static Map<TextFormFieldSettingType, ChatifyTextFormFieldSetting> values({
    ChatifyTextFormFieldBloc? bloc,
    ChatifyTextFormFieldInputBorderSetting? inputBorder,
  }) {
    return {
      TextFormFieldSettingType.account: ChatifyTextFormFieldSetting.account(
        bloc: bloc,
        inputBorder: inputBorder,
      ),
      TextFormFieldSettingType.showPassword:
          ChatifyTextFormFieldSetting.showPassword(
        bloc: bloc,
        inputBorder: inputBorder,
      ),
      TextFormFieldSettingType.hidePassword:
          ChatifyTextFormFieldSetting.hidePassword(
        bloc: bloc,
        inputBorder: inputBorder,
      ),
    };
  }
}
