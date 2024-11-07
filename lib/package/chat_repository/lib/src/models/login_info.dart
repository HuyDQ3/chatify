import 'package:equatable/equatable.dart';

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
}