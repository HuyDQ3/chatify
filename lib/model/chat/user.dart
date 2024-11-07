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

  static User chatRepositoryUser(chat_repository.User user) {
    // if (user != null) {
    //   return User(
    //     id: user.id,
    //     loginInfo: LoginInfo.chatRepositoryLoginInfo(user.loginInfo),
    //     personalInfo: PersonalInfo.chatRepositoryPersonalInfo(user.personalInfo),
    //   );
    // }
    // return null;
    return User(
      id: user.id,
      loginInfo: LoginInfo.chatRepositoryLoginInfo(user.loginInfo),
      personalInfo: PersonalInfo.chatRepositoryPersonalInfo(user.personalInfo),
    );
  }

  static User userRepositoryUser(user_repository.User user) {
    // if (user != null) {
    //   return User(
    //     id: user.id,
    //     loginInfo: LoginInfo.userRepositoryLoginInfo(user.loginInfo),
    //     personalInfo: PersonalInfo.userRepositoryPersonalInfo(user.personalInfo),
    //   );
    // }
    // return null;
    return User(
      id: user.id,
      loginInfo: LoginInfo.userRepositoryLoginInfo(user.loginInfo),
      personalInfo: PersonalInfo.userRepositoryPersonalInfo(user.personalInfo),
    );
  }
}