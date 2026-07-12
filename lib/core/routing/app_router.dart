import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/features/address_book/presentation/screens/address_book_screen.dart';
import 'package:men_store_app/features/auth/presentation/manager/log_in_cubit.dart';
import 'package:men_store_app/features/auth/presentation/screens/log_in_screen/log_in_screen.dart';
import 'package:men_store_app/features/auth/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:men_store_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:men_store_app/features/layout/presentation/screens/main_layout_screen.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';
import 'package:men_store_app/features/products/presentation/screens/home_screen/home_screen.dart';
import 'package:men_store_app/features/products/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:men_store_app/features/profile/presentation/screens/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellHome',
);
final _shellNavigatorCartKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellCart',
);
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellProfile',
);

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.logInScreen,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.logInScreen,
        name: AppRoutes.logInScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => LogInCubit(),
          child: const LogInScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayoutScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: AppRoutes.homeScreen,
                builder: (_, __) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'product-details',
                    name: AppRoutes.productDetailsScreen,
                    builder: (context, state) {
                      final product = state.extra as ProductModel;
                      return ProductDetailsScreen(product: product);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCartKey,
            routes: [
              GoRoute(
                path: AppRoutes.cartScreen,
                name: AppRoutes.cartScreen,
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: AppRoutes.accountScreen,
                name: AppRoutes.accountScreen,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: AppRoutes.addressBookScreen,
                    name: AppRoutes.addressBookScreen,
                    builder: (context, state) => const AddressBookScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
