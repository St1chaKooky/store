part of 'user_bloc.dart';

@immutable
class UserEvent {}

class GetUser extends UserEvent {
  final String id;
  GetUser(this.id);
}

