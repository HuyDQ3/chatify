import 'package:equatable/equatable.dart';

class UserRepositoryLoginInfo extends Equatable {
  UserRepositoryLoginInfo({required this.username, required this.password});

  UserRepositoryLoginInfo.huy() : username = "huy", password = "huy123";

  UserRepositoryLoginInfo.nghia() : username = "nghia", password = "nghia545";

  UserRepositoryLoginInfo.test() : username = "test", password = "test";

  String username;
  String password;

  @override
  List<Object?> get props => [username, password];

  static List<UserRepositoryLoginInfo> get getAll => [
    UserRepositoryLoginInfo.huy(),
    UserRepositoryLoginInfo.nghia(),
    UserRepositoryLoginInfo.test(),
  ];
}