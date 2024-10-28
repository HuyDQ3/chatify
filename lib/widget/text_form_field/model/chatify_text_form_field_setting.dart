import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_border_setting.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_decoration_setting.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldSetting {
  TextFormFieldSettingType settingType;
  String? id;
  ChatifyTextFormFieldBloc? bloc;
  InputBorderType? inputBorderType;
  // late ChatifyTextFormFieldInputBorderSetting inputBorderSetting;
  InputDecorationType? inputDecorationType;
  // late ChatifyTextFormFieldInputDecorationSetting inputDecorationSetting;
  TextEditingController? controller;
  FocusNode? focusNode;
  bool? obscureText;

  ChatifyTextFormFieldSetting(
    this.settingType, {
    this.id,
    this.controller,
    this.bloc,
    this.focusNode,
    this.inputBorderType,
    this.inputDecorationType,
    this.obscureText,
  }) {
    bloc ??= ChatifyTextFormFieldBloc();
    focusNode ??= FocusNode();
    if (inputDecorationType == InputDecorationType.hidePassword) {
      obscureText = true;
    } else {
      obscureText = false;
    }
  }

  // void initial() {
  //   blocTrigger();
  //   settingTrigger();
  //   obscureTextTrigger();
  // }

  // void settingTrigger() {
  //   inputBorderSetting =
  //       ChatifyTextFormFieldInputBorderSetting.getSettingByType(
  //           inputBorderType);
  //   switch (settingType) {
  //     case TextFormFieldSettingType.account:
  //       inputDecorationSetting =
  //           ChatifyTextFormFieldInputDecorationSetting.getSettingByType(
  //         InputDecorationType.account,
  //         bloc: bloc,
  //         inputBorderType: inputBorderType,
  //       );
  //     case TextFormFieldSettingType.showPassword:
  //       inputDecorationSetting =
  //           ChatifyTextFormFieldInputDecorationSetting.getSettingByType(
  //         InputDecorationType.showPassword,
  //         bloc: bloc,
  //         inputBorderType: inputBorderType,
  //       );
  //     case TextFormFieldSettingType.hidePassword:
  //       inputDecorationSetting =
  //           ChatifyTextFormFieldInputDecorationSetting.getSettingByType(
  //         InputDecorationType.hidePassword,
  //         bloc: bloc,
  //         inputBorderType: inputBorderType,
  //       );
  //   }
  // }

  // void blocTrigger() {
  //   bloc ??= ChatifyTextFormFieldBloc();
  // }
  //

  void obscureTextTrigger() {
    if (inputDecorationType == InputDecorationType.hidePassword) {
      obscureText = true;
    } else {
      obscureText = false;
    }
  }
}
