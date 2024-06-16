part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent{
  final String password;
  final String userName;

  Login({required this.password, required this.userName});
}

class SignUp extends AuthEvent{
  final String password;
  final String email;
  final String username;

  SignUp({
    required this.email,
    required this.username,
    required this.password,
    });
} 
