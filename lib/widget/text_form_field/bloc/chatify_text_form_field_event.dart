part of 'chatify_text_form_field_bloc.dart';

sealed class ChatifyTextFormFieldEvent extends Equatable {
  const ChatifyTextFormFieldEvent();
}

class ChangeSettingEvent extends ChatifyTextFormFieldEvent {
  final ChatifyTextFormFieldSetting? setting;

  const ChangeSettingEvent({this.setting});

  @override
  List<Object?> get props => [setting];
}

class ChangeInputBorderSettingEvent extends ChatifyTextFormFieldEvent {
  final ChatifyTextFormFieldInputBorderSetting? setting;

  const ChangeInputBorderSettingEvent({this.setting});

  @override
  List<Object?> get props => [setting];
}

class ChangeInputDecorationSettingEvent extends ChatifyTextFormFieldEvent {
  final ChatifyTextFormFieldInputDecorationSetting? setting;

  const ChangeInputDecorationSettingEvent({this.setting});

  @override
  List<Object?> get props => [setting];
}