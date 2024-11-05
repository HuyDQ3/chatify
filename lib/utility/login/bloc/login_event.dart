part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

// class ChatifyLoginEvent extends LoginEvent {
//   final LoginInfo? loginInfo;
//
//   const ChatifyLoginEvent({this.loginInfo});
//
//   @override
//   List<Object?> get props => [loginInfo];
// }

class LoginUsernameChanged extends LoginEvent {
  final String username;

  const LoginUsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginPasswordTextFieldShowed extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginPasswordTextFieldHided extends LoginEvent {
  @override
  List<Object?> get props => [];
}

