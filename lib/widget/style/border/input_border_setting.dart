import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:flutter/material.dart';

class InputBorderSetting {
  final InputBorderType inputBorderType;
  InputBorder? inputBorder;

  InputBorderSetting({
    required this.inputBorderType,
    this.inputBorder,
  });

  static InputBorderSetting getSettingByType(InputBorderType? type) {
    switch (type) {
      case InputBorderType.normal:
      default:
        return InputBorderSetting(
          inputBorderType: InputBorderType.normal,
          inputBorder: const OutlineInputBorder(),
        );
    }
  }
}