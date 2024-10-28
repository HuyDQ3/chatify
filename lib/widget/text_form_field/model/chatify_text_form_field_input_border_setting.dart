import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldInputBorderSetting {
  final String? id;
  final InputBorderType inputBorderType;
  InputBorder? inputBorder;

  ChatifyTextFormFieldInputBorderSetting(this.inputBorderType, {
    this.id,
    this.inputBorder,
  });

  static ChatifyTextFormFieldInputBorderSetting getSettingByType(InputBorderType? type) {
    switch (type) {
      case InputBorderType.normal:
      default:
        return ChatifyTextFormFieldInputBorderSetting(
          InputBorderType.normal,
          inputBorder: const OutlineInputBorder(),
        );
    }
  }
}
