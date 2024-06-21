import 'package:fake_store/core/router/router.dart';
import 'package:fake_store/feature/account/domain/bloc/user_bloc.dart';
import 'package:fake_store/feature/auth/data/userModel.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    super.key,
  });

  @override
  State<AccountPage> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountPage> {
  late final UserBloc bloc = context.read<UserBloc>();
  late UserModel user;
  @override
  void initState() {
    super.initState();
    bloc.add(GetUser('1'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return switch (state) {
          Loading() => Container(
              width: 10,
              height: 10,
            ),
          Succes(:final user) => Scaffold(
              appBar: AppBar(
                backgroundColor: ColorCollection.background,
                excludeHeaderSemantics: false,
                automaticallyImplyLeading: false,
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        context.push(RouteList.edit(), extra: user);
                      },
                      icon: const Icon(Icons.edit, color: ColorCollection.text))
                ],
                // leading: context.canPop()
                //     ? IconButton(
                //         onPressed: () {
                //           bloc.add(PaginationProducts(keyCategory: category));
                //           context.pop();
                //         },
                //         icon: const Icon(Icons.arrow_back_outlined, color: ColorCollection.text,))
                //     : const SizedBox.shrink(),
                title: Text(
                  'Мой аккаунт',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(top: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      initialDataBuilder,
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              user.username,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              user.email,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            )
        };
      },
    );
  }

  Widget get initialDataBuilder => Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://static.dw.com/image/64742971_804.jpg',
                      ),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 1,
              color: ColorCollection.input,
            ),
          ],
        ),
      );
}
