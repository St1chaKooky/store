import 'package:fake_store/core/feature/button_big.dart';
import 'package:fake_store/core/feature/input.dart';
import 'package:fake_store/core/router/router.dart';
import 'package:fake_store/feature/auth/repository/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameControll = TextEditingController();
  TextEditingController passWord = TextEditingController();
  ValueNotifier<String> error = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = context.read<AuthBloc>();
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
          bloc: bloc,
          listener: (context, state) {
            switch (state) {
              case AuthLoading():
                null;
              case Succes():
                context.go(RouteList.product);
              case Error(:final errorText):
                error.value = errorText;
            }
            print(state);
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight / 6.44,
                ),
                MyTextField(
                  textEditingController: nameControll,
                  labelText: 'Имя пользователя',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  textEditingController: passWord,
                  labelText: 'Пароль',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyFilledButton(
                  onTap: () async {
                    bloc.add(Login(
                        password: passWord.text, userName: nameControll.text));
                  },
                  text: 'Войти',
                ),
                const SizedBox(
                  height: 25,
                ),
                ValueListenableBuilder(
                  valueListenable: error,
                  builder: (context, state,child) {
                      return Text(
                        error.value,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.red),
                      );
                  }
                )
              ],
            ),
          )),
    );
  }
}
