import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fake_store/feature/account/domain/repo/user_repo.dart';
import 'package:fake_store/feature/auth/data/userModel.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepo repo;
  UserBloc({required this.repo}) : super(Loading()) {
    on<GetUser>(
      (event, emit) async {
        try {
          emit(Loading());
          String id = event.id;
          UserModel user = await repo.getUser(id);
          emit(Succes(user));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }
}
