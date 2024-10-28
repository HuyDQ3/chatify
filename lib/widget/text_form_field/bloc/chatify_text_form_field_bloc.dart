import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/constant/enum/bloc/bloc_enum.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_border_setting.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_input_decoration_setting.dart';
import 'package:chatify/widget/text_form_field/model/chatify_text_form_field_setting.dart';
import 'package:equatable/equatable.dart';

part 'chatify_text_form_field_event.dart';
part 'chatify_text_form_field_state.dart';

class ChatifyTextFormFieldBloc extends Bloc<ChatifyTextFormFieldEvent, ChatifyTextFormFieldState> {
  ChatifyTextFormFieldBloc() : super(ChatifyTextFormFieldInitial()) {
    on<ChatifyTextFormFieldEvent>((event, emit) {});
    // thay doi cai dat tong
    on<ChangeSettingEvent>(_onChangeSettingEvent);
    // thay doi cai dat khung cua thanh nhap
    on<ChangeInputBorderSettingEvent>(_onChangeInputBorderSettingEvent);
    // thay doi cai dat ben trong thanh nhap
    on<ChangeInputDecorationSettingEvent>(_onChangeInputDecorationSettingEvent);
  }

  Future<void> _onChangeSettingEvent(ChangeSettingEvent event, Emitter<ChatifyTextFormFieldState> emit) async {
    try {
      emit(ChangeSettingState(BlocStatusType.initial, setting: event.setting));
      emit(ChangeSettingState(BlocStatusType.loading, setting: event.setting));
      emit(ChangeSettingState(BlocStatusType.success, setting: event.setting));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(ChangeSettingState(BlocStatusType.failure, setting: event.setting, error: e.toString(), stackTrace: s));
    }
  }

  Future<void> _onChangeInputBorderSettingEvent(ChangeInputBorderSettingEvent event, Emitter<ChatifyTextFormFieldState> emit) async {
    try {
      emit(ChangeInputBorderSettingState(BlocStatusType.initial, setting: event.setting));
      emit(ChangeInputBorderSettingState(BlocStatusType.loading, setting: event.setting));
      emit(ChangeInputBorderSettingState(BlocStatusType.success, setting: event.setting));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(ChangeInputBorderSettingState(BlocStatusType.failure, setting: event.setting, error: e.toString(), stackTrace: s));
    }
  }

  Future<void> _onChangeInputDecorationSettingEvent(ChangeInputDecorationSettingEvent event, Emitter<ChatifyTextFormFieldState> emit) async {
    try {
      emit(ChangeInputDecorationSettingState(BlocStatusType.initial, setting: event.setting));
      emit(ChangeInputDecorationSettingState(BlocStatusType.loading, setting: event.setting));
      emit(ChangeInputDecorationSettingState(BlocStatusType.success, setting: event.setting));
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(ChangeInputDecorationSettingState(BlocStatusType.failure, setting: event.setting, error: e.toString(), stackTrace: s));
    }
  }
}
