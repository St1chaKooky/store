import 'package:fake_store/feature/account/presentation/widget/field.dart';
import 'package:fake_store/feature/auth/data/userModel.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditAccountPage extends StatefulWidget {
 final UserModel user;
  const EditAccountPage({super.key, required this.user});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  UserModel get userData => widget.user;
  late TextEditingController emailControll =
      TextEditingController(text: userData.email);
  late TextEditingController usernameControll =
      TextEditingController(text: userData.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCollection.background,
        excludeHeaderSemantics: false,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            
          }, icon: const Icon(Icons.check,color: ColorCollection.text))
        ],
        leading: context.canPop()
            ? IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_outlined, color: ColorCollection.text,))
            : const SizedBox.shrink(),
        title: Text(
          'Мой аккаунт',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            AccountTextField(
              textEditingController: emailControll,
              labelText: 'Почта',
            ),
            const SizedBox(
              height: 20,
            ),
            AccountTextField(
              textEditingController: usernameControll,
              labelText: 'Нейм',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

}