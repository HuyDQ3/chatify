import 'package:equatable/equatable.dart';

class LoginInfo extends Equatable {
  final String? account;
  final String? password;

  const LoginInfo({this.account, this.password});

  @override
  List<Object?> get props => [account, password];

  bool isAuthenticated(LoginInfo? info) {
    return identical(this, info);
  }
}