part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class ChatifyLoginState extends LoginState {
  final BlocStatusType status;
  final String? error;
  final LoginInfo? loginInfo;
  final AccountInfo? accountInfo;

  const ChatifyLoginState(this.status, {this.error, this.loginInfo, this.accountInfo});

  @override
  List<Object?> get props => [status, error, loginInfo, accountInfo];
}
