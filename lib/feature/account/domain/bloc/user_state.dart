part of 'user_bloc.dart';

@immutable
sealed class UserState {}

class Loading extends UserState {}

class Succes extends UserState {
  final UserModel user;
  Succes(this.user);
}
