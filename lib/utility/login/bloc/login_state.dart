part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;
  final bool isPasswordShow;

  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.isPasswordShow = false,
  });

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? isValid,
    bool? isPasswordShow,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isPasswordShow: isPasswordShow ?? this.isPasswordShow,
    );
  }

  @override
  List<Object?> get props => [status, username, password, isValid, isPasswordShow];
}

// final class LoginInitial extends LoginState {
//   @override
//   List<Object> get props => [];
// }

// class ChatifyLoginState extends LoginState {
//   final BlocStatusType status;
//   final String? error;
//   final LoginInfo? loginInfo;
//   final AccountInfo? accountInfo;
//
//   const ChatifyLoginState(this.status, {this.error, this.loginInfo, this.accountInfo});
//
//   @override
//   List<Object?> get props => [status, error, loginInfo, accountInfo];
// }

// class LoginWithUsernameAndPasswordState extends LoginState {
//
//
//   @override
//   List<Object?> get props => [status, username, password, isValid];
// }
