import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldInputBorderSetting {
  final String? id;
  final CustomInputBorderType inputBorderType;
  InputBorder? inputBorder;

  ChatifyTextFormFieldInputBorderSetting(this.inputBorderType, {
    this.id,
    this.inputBorder,
  });

  static ChatifyTextFormFieldInputBorderSetting get normal => ChatifyTextFormFieldInputBorderSetting(
    CustomInputBorderType.normal,
    inputBorder: const OutlineInputBorder(),
  );

  static Map<CustomInputBorderType, ChatifyTextFormFieldInputBorderSetting> get values => {
    CustomInputBorderType.normal: ChatifyTextFormFieldInputBorderSetting.normal,
  };
}
