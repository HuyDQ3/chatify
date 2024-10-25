part of 'begin_bloc.dart';

sealed class BeginEvent extends Equatable {
  const BeginEvent();
}

class SetUpResourceEvent extends BeginEvent {
  @override
  List<Object?> get props => [];
}
