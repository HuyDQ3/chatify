import 'package:equatable/equatable.dart';

class AuthenticationRepositoryLoginInfo extends Equatable {
  AuthenticationRepositoryLoginInfo({required this.username, required this.password});

  AuthenticationRepositoryLoginInfo.huy() : username = "huy", password = "huy123";

  AuthenticationRepositoryLoginInfo.nghia() : username = "nghia", password = "nghia545";

  AuthenticationRepositoryLoginInfo.test() : username = "test", password = "test";

  String username;
  String password;

  @override
  List<Object?> get props => [username, password];

  static List<AuthenticationRepositoryLoginInfo> get getAll => [
    AuthenticationRepositoryLoginInfo.huy(),
    AuthenticationRepositoryLoginInfo.nghia(),
    AuthenticationRepositoryLoginInfo.test(),
  ];
}