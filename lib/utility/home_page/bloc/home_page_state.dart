part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();
}

final class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}
