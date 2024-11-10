import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:authentication_repository/authentication_repository.dart' as authentication_repository;
import 'package:chatify/service/error/custom_logger.dart';
import 'package:user_repository/user_repository.dart' as user_repository;
import 'package:equatable/equatable.dart';
import 'package:chatify/model/chat/models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final authentication_repository.AuthenticationRepository _authenticationRepository;
  final user_repository.UserRepository _userRepository;

  AuthenticationBloc({
    required authentication_repository.AuthenticationRepository authenticationRepository,
    required user_repository.UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(AuthenticationState.unknown()) {

    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);

    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onSubscriptionRequested(
      AuthenticationSubscriptionRequested event,
      Emitter<AuthenticationState> emit) async {
    // try {
      // final value = await _tryGetUser();
    //   _authenticationRepository.status.listen((event) async {
    //     switch (event) {
    //       case AuthenticationStatus.unknown:
    //         emit(const AuthenticationState.unknown());
    //         break;
    //       case AuthenticationStatus.authenticated:
    //         // if (value != null) {
    //         //   emit(AuthenticationState.authenticated(value));
    //         // } else {
    //         //   emit(const AuthenticationState.unauthenticated());
    //         // }
    //         break;
    //       case AuthenticationStatus.unauthenticated:
    //         emit(const AuthenticationState.unauthenticated());
    //         break;
    //     }
    //   });
    // } catch (e, s) {
    //   logger.log(error: e, stackTrace: s);
    //   emit(const AuthenticationState.unknown());
    // }

    return emit.onEach<authentication_repository.AuthenticationStatus>(
      _authenticationRepository.status,
      onData: (data) async {
        switch (data) {
            case authentication_repository.AuthenticationStatus.unauthenticated:
            return emit(AuthenticationState.unauthenticated());
          case authentication_repository.AuthenticationStatus.authenticated:
            // final user = await _tryGetUser();
            // if (user != null) {
            //   return emit(AuthenticationState.authenticated(value));
            // } else {
            //   return emit(const AuthenticationState.unauthenticated());
            // }
            await _tryGetUser().then((value) {
              if (value != null) {
                return emit(AuthenticationState.authenticated(value));
              } else {
                return emit(AuthenticationState.unauthenticated());
              }
            });
          case authentication_repository.AuthenticationStatus.unknown:
            return emit(AuthenticationState.unknown());
        }
      },
      onError: (error, stackTrace) {
        emit(AuthenticationState.unknown());
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
      user_repository.UserRepositoryUser? user = _userRepository.user;
      if (user != null) {
        return User.fromUserRepositoryUser(user);
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
