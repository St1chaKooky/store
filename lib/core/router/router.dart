import 'package:fake_store/feature/auth/presentation/auth_page.dart';
import 'package:fake_store/feature/bottom_bar/bottom_bar.dart';
import 'package:fake_store/feature/cart/presentation/cart_page.dart';
import 'package:fake_store/feature/product/presentation/page/products_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RouteList {

   static const _authPath = '/auth';
  static const auth = _authPath;

   static const _productPath = '/product';
  static const product = _productPath;

   static const _cartPath = '/cart';
  static const cart = _cartPath;

}
final router = GoRouter(
  initialLocation: RouteList.auth,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
            bool hasMultipleSlashes(String string) {
  final parts = string.split('/auth'); 
  return parts.length <= 2; 
}

        return ScaffoldWithNavBar(
          navigationShell: navigationShell,
          showBottomBar: !hasMultipleSlashes(state.fullPath!),
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: RouteList.product,
          routes: <RouteBase>[
            GoRoute(
                path: RouteList.product,
                builder: (context, state) => ProductsListPage(
                      
                    ),
                ),
          ],
        ),

        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteList.cart,
                builder: (context, state) => CartPage(
                      
                    ),
                ),
          ],
        ),

        
      ],
    ),
    GoRoute(
        path: RouteList._authPath,
        builder: (context, state) => AuthScreen(
            ),
        ),
  ],
);