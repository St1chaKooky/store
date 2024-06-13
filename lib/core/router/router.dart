import 'package:fake_store/feature/account/presentation/account_page.dart';
import 'package:fake_store/feature/auth/presentation/auth_page.dart';
import 'package:fake_store/feature/bottom_bar/bottom_bar.dart';
import 'package:fake_store/feature/cart/presentation/cart_page.dart';
import 'package:fake_store/feature/product/presentation/page/product_details.dart';
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

  static const _accountPath = '/account';
  static const account = _accountPath;

  static const _productDetailsPath = 'productDetails';
  static String productDetails(String id) => '$product/$_productDetailsPath/$id';
}

final router = GoRouter(
  initialLocation: RouteList.product,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        bool hasMultipleSlashes(String string) {
          final parts = string.split('/product');
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
              routes: [
                GoRoute(
                  path: '${RouteList._productDetailsPath}/:id',
                  builder: (context, state) {
                    final id = state.pathParameters['id'];
                    return ProductDetails(id: id!);
                  },
                )
              ],
              path: RouteList.product,
              builder: (context, state) => const ProductsListPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouteList.cart,
              builder: (context, state) => CartPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouteList.account,
              builder: (context, state) => AccountPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RouteList._authPath,
      builder: (context, state) => AuthScreen(),
    ),
  ],
);
