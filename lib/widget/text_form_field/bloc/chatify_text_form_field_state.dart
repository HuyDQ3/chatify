part of 'chatify_text_form_field_bloc.dart';

sealed class ChatifyTextFormFieldState extends Equatable {
  const ChatifyTextFormFieldState();
}

final class ChatifyTextFormFieldInitial extends ChatifyTextFormFieldState {
  @override
  List<Object> get props => [];
}

class ChangeSettingState extends ChatifyTextFormFieldState {
  final BlocStatusType status;
  final String? error;
  final StackTrace? stackTrace;
  final ChatifyTextFormFieldSetting? setting;

  const ChangeSettingState(
    this.status, {
    this.error,
    this.stackTrace,
    this.setting,
  });

  @override
  List<Object?> get props => [status, error, stackTrace, setting];
}

class ChangeInputBorderSettingState extends ChatifyTextFormFieldState {
  final BlocStatusType status;
  final String? error;
  final StackTrace? stackTrace;
  final ChatifyTextFormFieldInputBorderSetting? setting;

  const ChangeInputBorderSettingState(
    this.status, {
    this.error,
    this.stackTrace,
    this.setting,
  });

  @override
  List<Object?> get props => [status, error, stackTrace, setting];
}

class ChangeInputDecorationSettingState extends ChatifyTextFormFieldState {
  final BlocStatusType status;
  final String? error;
  final StackTrace? stackTrace;
  final ChatifyTextFormFieldInputDecorationSetting? setting;

  const ChangeInputDecorationSettingState(
    this.status, {
    this.error,
    this.stackTrace,
    this.setting,
  });

  @override
  List<Object?> get props => [status, error, stackTrace, setting];
}
