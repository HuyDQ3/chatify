import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/constant/enum/bloc_enum.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:chatify/utility/login/repo/login_repo.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<ChatifyLoginEvent>(_onChatifyLoginEvent);
  }

  var loginRepo = LoginRepo();

  Future<void> _onChatifyLoginEvent(ChatifyLoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(ChatifyLoginState(BlocStatusType.initial, loginInfo: event.loginInfo));
      emit(ChatifyLoginState(BlocStatusType.loading, loginInfo: event.loginInfo));
      AccountInfo? currentLoginAccount = await loginRepo.login(event.loginInfo!);
      if (event.loginInfo != null && currentLoginAccount != null) {
        emit(ChatifyLoginState(BlocStatusType.success, loginInfo: event.loginInfo, accountInfo: currentLoginAccount));
      }
      else {
        emit(ChatifyLoginState(BlocStatusType.failure, loginInfo: event.loginInfo));
      }
    }
    catch (e, s) {
      emit(ChatifyLoginState(BlocStatusType.failure, loginInfo: event.loginInfo));
      logger.log(error: e, stackTrace: s);
    }
  }
}
