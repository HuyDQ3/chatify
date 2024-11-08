part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  AuthenticationState._({
    this.status = authentication_repository.AuthenticationStatus.unknown,
    User? user,
  }) : _user = user ?? User.fromUserRepositoryUser(user_repository.User.test());

  AuthenticationState.unknown() : this._();

  AuthenticationState.authenticated(User user)
      : this._(status: authentication_repository.AuthenticationStatus.authenticated, user: user);

  AuthenticationState.unauthenticated()
      : this._(status: authentication_repository.AuthenticationStatus.unauthenticated);

  final authentication_repository.AuthenticationStatus status;
  final User _user;

  @override
  List<Object> get props => [status, _user];
}
