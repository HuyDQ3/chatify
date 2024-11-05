import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatify/package/authentication_repository/lib/authentication_repository.dart';
import 'package:chatify/package/user_repository/lib/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onSubscriptionRequested(
      AuthenticationSubscriptionRequested event,
      Emitter<AuthenticationState> emit) async {
    return emit.forEach(
      _authenticationRepository.status,
      onData: (data) {
        switch (data) {
          case AuthenticationStatus.unauthenticated:
            return const AuthenticationState.unauthenticated();
          case AuthenticationStatus.authenticated:
            _tryGetUser().then((value) {
              value != null
                  ? AuthenticationState.authenticated(value)
                  : const AuthenticationState.unauthenticated();
            });
          case AuthenticationStatus.unknown:
            return const AuthenticationState.unknown();
        }
        return const AuthenticationState.unknown();
      },
      onError: (error, stackTrace) {
        return const AuthenticationState.unknown();
      },
    );
  }

  Future<void> _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) async {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      // final user = await _userRepository.getUser();
      // return user;
      return null;
    } catch (_) {
      return null;
    }
  }
}
