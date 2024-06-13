import 'package:fake_store/core/feature/button_big.dart';
import 'package:fake_store/core/feature/input.dart';
import 'package:fake_store/core/router/router.dart';
import 'package:fake_store/feature/auth/repository/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();
  TextEditingController emailControll = TextEditingController();

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
                  textEditingController: emailControll,
                  labelText: 'Почта',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  textEditingController: passwordControll,
                  labelText: 'Пароль',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyFilledButton(
                  onTap: () async {
                    bloc.add(SignUp(
                        password: passwordControll.text,
                        username: nameControll.text,
                        email: emailControll.text));
                  },
                  text: 'Войти',
                ),
                const SizedBox(
                  height: 25,
                ),
                ValueListenableBuilder(
                    valueListenable: error,
                    builder: (context, state, child) {
                      return Text(
                        error.value,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.red),
                      );
                    })
              ],
            ),
          )),
    );
  }
}
