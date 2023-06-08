import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_ubah/tugas6/screens/category_screens.dart';
import 'package:tugas_ubah/tugas6/screens/product_list_screen.dart';
import 'package:tugas_ubah/tugas6/screens/screens.dart';
import 'package:tugas_ubah/tugas6/user/kalender3.dart';

import '../admin/admin.dart';
import '../cubits/cubit/login_cubit.dart';
import '../screens/logins.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            // return const AdminPage();
            return const Text("Login Berhasil");
          },
          routes: [
            GoRoute(
              path: 'product_list/:category',
              name: 'product_list',
              builder: (BuildContext context, GoRouterState state) {
                return ProductListScreen(
                  category: state.params['category']!,
                  asc: state.queryParams['sort'] == 'asc',
                  quantity: int.parse(state.queryParams['filter'] ?? '0'),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/a',
          name: 'homa',
          builder: (BuildContext context, GoRouterState state) {
            return Calendar();
          },
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        final bool loggedIn =
            loginCubit.state.status == AuthStatus.authenticated ||
                loginCubit.state.status == AuthStatus.authenticated1;
        final bool loggingIn = state.subloc == '/login';

        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }
        if (loggingIn) {
          // return '/';
          if (loginCubit.state.status == AuthStatus.authenticated) {
            return '/';
          } else if (loginCubit.state.status == AuthStatus.authenticated1) {
            return '/a';
          }
        }
        return null;
      },
      refreshListenable: GoRouterRefreshStream(loginCubit.stream));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
