import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'models.dart';

class User extends Equatable {
  String id;
  LoginInfo loginInfo;
  PersonalInfo personalInfo;

  User({required this.id, required this.loginInfo, required this.personalInfo});

  User.huy()
      : id = "huyID",
        loginInfo = LoginInfo.huy(),
        personalInfo = PersonalInfo.huy();

  User.nghia()
      : id = "nghiaID",
        loginInfo = LoginInfo.nghia(),
        personalInfo = PersonalInfo.nghia();

  User.test()
      : id = "test",
        loginInfo = LoginInfo.test(),
        personalInfo = PersonalInfo.test();

  @override
  List<Object?> get props => [id, loginInfo, personalInfo];

  bool isCurrentLoginAccount(String id) {
    return this.id.compareTo(id) == 0;
  }

  User copyWith({
    String? id,
    PersonalInfo? personalInfo,
    LoginInfo? loginInfo,
  }) {
    return User(
      id: id ?? this.id,
      personalInfo: personalInfo ?? this.personalInfo,
      loginInfo: loginInfo ?? this.loginInfo,
    );
  }
}
