import 'package:fake_store/feature/auth/presentation/login_page.dart';
import 'package:fake_store/feature/auth/presentation/sign_up_page.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            dividerColor: ColorCollection.input,
            unselectedLabelColor: ColorCollection.text,
            labelColor: ColorCollection.primary,
            labelStyle: theme.titleLarge,
            unselectedLabelStyle: theme.titleLarge,
            tabs: const [
              Tab(
                text: 'Войти',
              ),
              Tab(
                text:'Регистрация',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoginPage(
            ),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}