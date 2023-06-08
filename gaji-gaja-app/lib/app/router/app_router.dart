import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../cubits/cubit/login_cubit.dart';
import '../screens/auth/logins.dart';
import '../screens/main_view.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        // login screen
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),

        // home screen
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            // return const AdminPage();
            return const MainView();
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
