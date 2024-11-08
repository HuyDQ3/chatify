import 'package:equatable/equatable.dart';

import 'models.dart';

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
}