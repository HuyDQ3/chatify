import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
import 'package:flutter/material.dart';

class ChatifyTextFormFieldInputDecorationSetting {
  final InputDecorationType inputDecorationType;
  Widget? prefix, prefixIcon, suffix, suffixIcon;
  // InputBorder? inputBorder;
  // InputBorderType? inputBorderType;
  InputDecoration? inputDecoration;

  ChatifyTextFormFieldInputDecorationSetting({
    required this.inputDecorationType,
    // this.inputBorder,
    this.inputDecoration,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  });

  // static ChatifyTextFormFieldInputDecorationSetting get account {
  //   return ChatifyTextFormFieldInputDecorationSetting(
  //     inputDecorationType: InputDecorationType.account,
  //     inputDecoration: const InputDecoration(
  //       prefixIcon: Icon(Icons.account_box),
  //       labelText: TextConstant.account,
  //     ),
  //   );
  // }
  //
  // static ChatifyTextFormFieldInputDecorationSetting password({ChatifyTextFormFieldBloc? bloc}) {
  //   return ChatifyTextFormFieldInputDecorationSetting(
  //     inputDecorationType: InputDecorationType.account,
  //     inputDecoration: const InputDecoration(
  //       prefixIcon: Icon(Icons.account_box),
  //       labelText: TextConstant.account,
  //     ),
  //   );
  // }
  //
  // static ChatifyTextFormFieldInputDecorationSetting? getSettingByType(
  //   InputDecorationType? type, {
  //   ChatifyTextFormFieldSetting? chatifyTextFormFieldSetting,
  //   ChatifyTextFormFieldBloc? bloc,
  //   InputBorderType? inputBorderType,
  // }) {
  //   InputBorder? inputBorder =
  //       ChatifyTextFormFieldInputBorderSetting.getSettingByType(inputBorderType)
  //           .inputBorder;
  //   switch (type) {
  //     case InputDecorationType.account:
  //       return ChatifyTextFormFieldInputDecorationSetting(
  //         // InputDecorationType.account,
  //         inputDecoration: InputDecoration(
  //           prefixIcon: const Icon(Icons.account_box),
  //           labelText: TextConstant.account,
  //           border: inputBorder,
  //         ),
  //       );
  //     case InputDecorationType.hidePassword:
  //       return ChatifyTextFormFieldInputDecorationSetting(
  //         // InputDecorationType.hidePassword,
  //         inputDecoration: InputDecoration(
  //           labelText: TextConstant.password,
  //           prefixIcon: const Icon(Icons.password),
  //           suffix: IconButton(
  //             icon: const Icon(Icons.visibility_off),
  //             splashRadius: 24,
  //             onPressed: () {
  //               bloc?.add(ChangeSettingEvent(
  //                   setting: ChatifyTextFormFieldSetting(
  //                       TextFormFieldSettingType.showPassword,
  //                       bloc: bloc)));
  //             },
  //           ),
  //           border: inputBorder,
  //         ),
  //       );
  //     case InputDecorationType.showPassword:
  //       return ChatifyTextFormFieldInputDecorationSetting(
  //         InputDecorationType.showPassword,
  //         inputDecoration: InputDecoration(
  //           labelText: TextConstant.password,
  //           prefixIcon: const Icon(Icons.password),
  //           suffix: IconButton(
  //             icon: const Icon(Icons.visibility),
  //             splashRadius: 24,
  //             onPressed: () {
  //               bloc?.add(ChangeSettingEvent(
  //                   setting: ChatifyTextFormFieldSetting(
  //                       TextFormFieldSettingType.hidePassword,
  //                       bloc: bloc)));
  //             },
  //           ),
  //           border: inputBorder,
  //         ),
  //       );
  //     case null:
  //       return null;
  //   }
  // }
}
