part of 'begin_bloc.dart';

sealed class BeginState extends Equatable {
  const BeginState();
}

final class BeginInitial extends BeginState {
  @override
  List<Object?> get props => [];
}

final class SetUpResourceState extends BeginState {
  final BlocStatusType status;
  final String? error;

  const SetUpResourceState(this.status, {this.error});

  @override
  List<Object?> get props => [status, error];
}