import 'package:fake_store/core/feature/button_big.dart';
import 'package:fake_store/core/feature/input.dart';
import 'package:fake_store/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double  screenHeight = MediaQuery.sizeOf(context).height;
    return  Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          SizedBox(
            height: screenHeight / 6.44,
          ),
        MyTextField(textEditingController: TextEditingController(), labelText: 'Почта',),
        const SizedBox(height: 10,),
        MyTextField(textEditingController: TextEditingController(), labelText: 'Пароль', isPassword: true,),
        const SizedBox(height: 15,),

        MyFilledButton(onTap: () {
          context.go(RouteList.product);
        }, text: 'Войти',),

        ],),
      ),
    );
  }
}