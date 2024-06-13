import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fake_store/feature/auth/data/loginModel.dart';
import 'package:fake_store/feature/auth/data/userModel.dart';
import 'package:fake_store/feature/auth/repository/service/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo repo;
  AuthBloc({required this.repo}) : super(AuthLoading()) {
    on<Login>(
      (event, emit) async {
        try {
          emit(AuthLoading());
          LoginModel user =
              LoginModel(password: event.password, username: event.userName);
          String responceToken = await repo.signIn(user);
          log(responceToken);
          emit(Succes());
        } catch (e) {
          log('error');
          emit(Error(errorText: 'Не верный логин или пароль'));
        }
      },
    );
    on<SignUp>(
      (event, emit) async {
        try {
          UserModel user = UserModel(
          email: event.email,
          username: event.username,
          password: event.password,
        );
        var responseId = await repo.signUp(user);
        log(responseId.toString());
        emit(Succes());
        } catch (e){
        log(e.toString());

          emit(Error(errorText: 'Повторите попытку позже'));
        }
      },
    );
  }
}
