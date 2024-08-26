part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState{}

final class HomeInitial extends HomeState {}

class FetchingUserState extends HomeState{
  List<User> userList;

  FetchingUserState({required this.userList});
}

class LoadingUserState extends HomeState{}

class LoadingErrorState extends HomeState{}


