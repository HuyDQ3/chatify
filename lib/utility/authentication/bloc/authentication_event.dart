part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

final class AuthenticationLogoutPressed extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}