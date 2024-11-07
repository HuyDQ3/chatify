part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    User? user,
  }) : _user = user ?? User.test();

  AuthenticationState.unknown() : this._();

  AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User _user;

  @override
  List<Object> get props => [status, _user];
}
