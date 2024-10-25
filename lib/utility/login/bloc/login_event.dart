part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class ChatifyLoginEvent extends LoginEvent {
  final LoginInfo? loginInfo;

  const ChatifyLoginEvent({this.loginInfo});

  @override
  List<Object?> get props => [loginInfo];
}
