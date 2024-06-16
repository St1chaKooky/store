part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthLoading extends AuthState {}

class Succes extends AuthState {
  // final String token;
  // Succes({required this.token});
}
class Error extends AuthState {
  final String errorText;

  Error({required this.errorText});
}

