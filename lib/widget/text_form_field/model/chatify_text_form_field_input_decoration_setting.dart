import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_border_setting.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldInputDecorationSetting {
  InputDecorationType inputDecorationType;
  InputDecoration? inputDecoration;
  String? id;

  ChatifyTextFormFieldInputDecorationSetting(
    this.inputDecorationType, {
    this.id,
    this.inputDecoration,
  });

  static ChatifyTextFormFieldInputDecorationSetting? getSettingByType(
    InputDecorationType? type, {
    ChatifyTextFormFieldSetting? chatifyTextFormFieldSetting,
    ChatifyTextFormFieldBloc? bloc,
    InputBorderType? inputBorderType,
  }) {
    InputBorder? inputBorder =
        ChatifyTextFormFieldInputBorderSetting.getSettingByType(inputBorderType)
            .inputBorder;
    switch (type) {
      case InputDecorationType.account:
        return ChatifyTextFormFieldInputDecorationSetting(
          InputDecorationType.account,
          inputDecoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_box),
            labelText: TextConstant.account,
            border: inputBorder,
          ),
        );
      case InputDecorationType.hidePassword:
        return ChatifyTextFormFieldInputDecorationSetting(
          InputDecorationType.hidePassword,
          inputDecoration: InputDecoration(
            labelText: TextConstant.password,
            prefixIcon: const Icon(Icons.password),
            suffix: IconButton(
              icon: const Icon(Icons.visibility_off),
              splashRadius: 24,
              onPressed: () {
                bloc?.add(ChangeSettingEvent(
                    setting: ChatifyTextFormFieldSetting(
                        TextFormFieldSettingType.showPassword,
                        bloc: bloc)));
              },
            ),
            border: inputBorder,
          ),
        );
      case InputDecorationType.showPassword:
        return ChatifyTextFormFieldInputDecorationSetting(
          InputDecorationType.showPassword,
          inputDecoration: InputDecoration(
            labelText: TextConstant.password,
            prefixIcon: const Icon(Icons.password),
            suffix: IconButton(
              icon: const Icon(Icons.visibility),
              splashRadius: 24,
              onPressed: () {
                bloc?.add(ChangeSettingEvent(
                    setting: ChatifyTextFormFieldSetting(
                        TextFormFieldSettingType.hidePassword,
                        bloc: bloc)));
              },
            ),
            border: inputBorder,
          ),
        );
      case null:
        return null;
    }
  }
}
