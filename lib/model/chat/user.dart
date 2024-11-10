import 'package:equatable/equatable.dart';

import 'models.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

class User extends Equatable {
  String id;
  LoginInfo loginInfo;
  PersonalInfo personalInfo;

  User({required this.id, required this.loginInfo, required this.personalInfo});

  User.huy() : id = "huyID",
  loginInfo = LoginInfo.huy(),
  personalInfo = PersonalInfo.huy();

  User.nghia() : id = "nghiaID",
        loginInfo = LoginInfo.nghia(),
        personalInfo = PersonalInfo.nghia();

  User.empty() : id = "testId",
        loginInfo = LoginInfo.test(),
        personalInfo = PersonalInfo.test();

  @override
  List<Object?> get props => [id, loginInfo, personalInfo];

  bool isCurrentLoginAccount(String id) {
    return this.id.compareTo(id) == 0;
  }

  static User fromChatRepositoryUser(chat_repository.User user) {
    return User(
      id: user.id,
      loginInfo: LoginInfo.fromChatRepositoryLoginInfo(user.loginInfo),
      personalInfo: PersonalInfo.fromChatRepositoryPersonalInfo(user.personalInfo),
    );
  }

  static chat_repository.User toChatRepositoryUser(User user) {
    return chat_repository.User(
      id: user.id,
      loginInfo: LoginInfo.toChatRepositoryLoginInfo(user.loginInfo),
      personalInfo: PersonalInfo.toChatRepositoryPersonalInfo(user.personalInfo),
    );
  }

  static User fromUserRepositoryUser(user_repository.UserRepositoryUser user) {
    return User(
      id: user.id,
      loginInfo: LoginInfo.fromUserRepositoryLoginInfo(user.loginInfo),
      personalInfo: PersonalInfo.fromUserRepositoryPersonalInfo(user.personalInfo),
    );
  }

  static user_repository.UserRepositoryUser toUserRepositoryUser(User user) {
    return user_repository.UserRepositoryUser(
      id: user.id,
      loginInfo: LoginInfo.toUserRepositoryLoginInfo(user.loginInfo),
      personalInfo: PersonalInfo.toUserRepositoryPersonalInfo(user.personalInfo),
    );
  }
}