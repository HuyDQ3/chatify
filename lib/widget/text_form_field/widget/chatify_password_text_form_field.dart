// import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
// import 'package:chatify/constant/enum/text_form_field/custom_text_form_field_enum.dart';
// import 'package:chatify/widget/text_form_field/bloc/chatify_text_form_field_bloc.dart';
// import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_border_setting.dart';
// import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_decoration_setting.dart';
// import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ChatifyPasswordTextFormField extends StatefulWidget {
//   const ChatifyPasswordTextFormField({
//     super.key,
//     // required this.setting,
//   });
//
//   // final ChatifyTextFormFieldSetting setting;
//
//   @override
//   State<ChatifyPasswordTextFormField> createState() =>
//       _ChatifyPasswordTextFormFieldState();
// }
//
// class _ChatifyPasswordTextFormFieldState
//     extends State<ChatifyPasswordTextFormField> {
//   ChatifyTextFormFieldSetting setting = ChatifyTextFormFieldSetting(
//     inputDecoration: InputDecoration(
//       border: ChatifyTextFormFieldInputBorderSetting.getSettingByType(InputBorderType.normal).inputBorder,
//
//     ),
//   );
//   ChatifyTextFormFieldBloc? bloc;
//
//   @override
//   void initState() {
//     super.initState();
//     setting = widget.setting;
//     bloc = widget.setting.bloc;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChatifyTextFormFieldBloc, ChatifyTextFormFieldState>(
//       bloc: bloc,
//       buildWhen: (previous, current) {
//         return [
//           TextFormFieldSettingType.showPassword,
//           TextFormFieldSettingType.hidePassword,
//         ].any((element) => element == setting?.settingType);
//       },
//       builder: (context, state) {
//         if (state is ChangeSettingState &&
//             state.status == BlocStatusType.success &&
//             state.setting != null) {
//           setting = state.setting!;
//         } else if (state is ChangeInputBorderSettingState &&
//             state.status == BlocStatusType.success &&
//             state.setting != null) {
//           setting?.inputBorderType = state.setting!.inputBorderType;
//         } else if (state is ChangeInputDecorationSettingState &&
//             state.status == BlocStatusType.success &&
//             state.setting != null) {
//           setting?.inputDecorationType = state.setting!.inputDecorationType;
//         }
//         setting?.obscureTextTrigger();
//         return TextFormField(
//           controller: setting?.controller,
//           decoration:
//               ChatifyTextFormFieldInputDecorationSetting.getSettingByType(
//                       setting?.inputDecorationType)
//                   ?.inputDecoration,
//           obscureText: setting?.obscureText ?? false,
//         );
//       },
//     );
//   }
// }
