part of 'user_bloc.dart';

@immutable
sealed class UserState {}

abstract class UserActionState extends UserState {}

final class UserInitial extends UserState {}

class UserFetchingLoadingState extends UserState {}

class UserFetchingSuccessState extends UserState {
  final List<UserModel> user;

  UserFetchingSuccessState({required this.user});

}

class UserFetchingErrorState extends UserState {}
