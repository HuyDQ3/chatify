import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:chatify/service/error/custom_logger.dart';
import 'package:user_repository/user_repository.dart';
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

    return emit.onEach(
      _authenticationRepository.status,
      onData: (data) async {
        switch (data) {
          case AuthenticationStatus.unauthenticated:
            return emit(const AuthenticationState.unauthenticated());
          case AuthenticationStatus.authenticated:
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
                return emit(const AuthenticationState.unauthenticated());
              }
            });
          case AuthenticationStatus.unknown:
            return emit(const AuthenticationState.unknown());
        }
      },
      onError: (error, stackTrace) {
        emit(const AuthenticationState.unknown());
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
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
