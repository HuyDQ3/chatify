import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        if (AuthenticationRepositoryLoginInfo.getAll.any((element) =>
            element.password.compareTo(password) == 0 &&
            element.username.compareTo(username) == 0)) {
          _controller.add(AuthenticationStatus.authenticated);
        } else {
          _controller.add(AuthenticationStatus.unauthenticated);
          throw Exception("account is not exists");
        }
      },
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
