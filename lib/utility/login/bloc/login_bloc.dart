import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;

import '../login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authentication_repository.AuthenticationRepository _authenticationRepository;

  LoginBloc({
    required authentication_repository.AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEvent>((event, emit) {});

    // on<ChatifyLoginEvent>(_onChatifyLoginEvent);

    on<LoginPasswordChanged>(_onLoginPasswordChanged);

    on<LoginUsernameChanged>(_onLoginUsernameChanged);

    on<LoginSubmitted>(_onLoginSubmitted);

    on<LoginPasswordTextFieldHided>(_onLoginPasswordTextFieldHided);

    on<LoginPasswordTextFieldShowed>(_onLoginPasswordTextFieldShowed);
  }

  // var loginRepo = LoginRepo();

  // Future<void> _onChatifyLoginEvent(ChatifyLoginEvent event, Emitter<LoginState> emit) async {
  //   try {
  //     emit(ChatifyLoginState(BlocStatusType.initial, loginInfo: event.loginInfo));
  //     emit(ChatifyLoginState(BlocStatusType.loading, loginInfo: event.loginInfo));
  //     AccountInfo? currentLoginAccount = await loginRepo.login(event.loginInfo!);
  //     if (event.loginInfo != null && currentLoginAccount != null) {
  //       emit(ChatifyLoginState(BlocStatusType.success, loginInfo: event.loginInfo, accountInfo: currentLoginAccount));
  //     }
  //     else {
  //       emit(ChatifyLoginState(BlocStatusType.failure, loginInfo: event.loginInfo));
  //     }
  //   }
  //   catch (e, s) {
  //     emit(ChatifyLoginState(BlocStatusType.failure, loginInfo: event.loginInfo));
  //     logger.log(error: e, stackTrace: s);
  //   }
  // }

  Future<void> _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) async {
    final password = Password.dirty(event.password);
    // final inputs = <FormzInput>[password, state.username];
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username])));
  }

  Future<void> _onLoginUsernameChanged(
      LoginUsernameChanged event, Emitter<LoginState> emit) async {
    final username = Username.dirty(event.username);
    // final inputs = <FormzInput>[state.password, username];
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username])));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    try {
      if (state.isValid) {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      }
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> _onLoginPasswordTextFieldHided(
      LoginPasswordTextFieldHided event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isPasswordShow: false));
  }

  Future<void> _onLoginPasswordTextFieldShowed(
      LoginPasswordTextFieldShowed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isPasswordShow: true));
  }
}
