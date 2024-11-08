import 'package:equatable/equatable.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;

class LoginInfo extends Equatable {
  LoginInfo({required this.username, required this.password});

  LoginInfo.huy() : username = "huy", password = "huy123";

  LoginInfo.nghia() : username = "nghia", password = "nghia545";

  LoginInfo.test() : username = "test", password = "test";

  String username;
  String password;

  @override
  List<Object?> get props => [username, password];

  static List<LoginInfo> get getAll => [
    LoginInfo.huy(),
    LoginInfo.nghia(),
    LoginInfo.test(),
  ];

  static LoginInfo fromChatRepositoryLoginInfo(chat_repository.LoginInfo loginInfo) {
    return LoginInfo(username: loginInfo.username, password: loginInfo.password);
  }

  static chat_repository.LoginInfo toChatRepositoryLoginInfo(LoginInfo loginInfo) {
    return chat_repository.LoginInfo(username: loginInfo.username, password: loginInfo.password);
  }

  static LoginInfo fromUserRepositoryLoginInfo(user_repository.LoginInfo loginInfo) {
    return LoginInfo(username: loginInfo.username, password: loginInfo.password);
  }

  static user_repository.LoginInfo toUserRepositoryLoginInfo(LoginInfo loginInfo) {
    return user_repository.LoginInfo(username: loginInfo.username, password: loginInfo.password);
  }

  static LoginInfo fromAuthenticationRepositoryLoginInfo(authentication_repository.LoginInfo loginInfo) {
    return LoginInfo(username: loginInfo.username, password: loginInfo.password);
  }

  static authentication_repository.LoginInfo toAuthenticationRepositoryLoginInfo(LoginInfo loginInfo) {
    return authentication_repository.LoginInfo(username: loginInfo.username, password: loginInfo.password);
  }
}