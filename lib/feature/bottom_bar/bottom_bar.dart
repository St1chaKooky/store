import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  final bool showBottomBar;
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
    this.showBottomBar = true,
  });

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: showBottomBar
          ? null
          : BottomNavigationBar(
              backgroundColor: ColorCollection.white,
              selectedItemColor: ColorCollection.primary,
              unselectedLabelStyle:
                  Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: ColorCollection.bottomBar,
                      ),
              selectedLabelStyle:
                  Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: ColorCollection.primary,
                        fontWeight: FontWeight.w600,
                      ),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Главная'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Корзина',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Аккаунт',
                )
              ],
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) => _onTap(context, index),
            ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
