import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'models.dart';

class UserRepositoryUser extends Equatable {
  String id;
  UserRepositoryLoginInfo loginInfo;
  UserRepositoryPersonalInfo personalInfo;

  UserRepositoryUser({required this.id, required this.loginInfo, required this.personalInfo});

  UserRepositoryUser.huy()
      : id = "huyID",
        loginInfo = UserRepositoryLoginInfo.huy(),
        personalInfo = UserRepositoryPersonalInfo.huy();

  UserRepositoryUser.nghia()
      : id = "nghiaID",
        loginInfo = UserRepositoryLoginInfo.nghia(),
        personalInfo = UserRepositoryPersonalInfo.nghia();

  UserRepositoryUser.test()
      : id = "test",
        loginInfo = UserRepositoryLoginInfo.test(),
        personalInfo = UserRepositoryPersonalInfo.test();

  @override
  List<Object?> get props => [id, loginInfo, personalInfo];

  bool isCurrentLoginAccount(String id) {
    return this.id.compareTo(id) == 0;
  }

  UserRepositoryUser copyWith({
    String? id,
    UserRepositoryPersonalInfo? personalInfo,
    UserRepositoryLoginInfo? loginInfo,
  }) {
    return UserRepositoryUser(
      id: id ?? this.id,
      personalInfo: personalInfo ?? this.personalInfo,
      loginInfo: loginInfo ?? this.loginInfo,
    );
  }

  static List<UserRepositoryUser> get getAll => [
    UserRepositoryUser.test(),
    UserRepositoryUser.huy(),
    UserRepositoryUser.nghia(),
  ];
}
