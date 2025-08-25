import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_live_chat/app.dart';
import 'package:nex_live_chat/routers/app_navigator_observer.dart';
import 'package:nex_live_chat/routers/app_routes.dart';
import 'package:nex_live_chat/screens/login/login_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: false,
    observers: [AppNavObserver(), SentryNavigatorObserver(setRouteNameAsTransaction: true, enableAutoTransactions: true)],
    navigatorKey: App.appNavigateKey,
    initialLocation: AppRoutes.login,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(state, const LoginScreen());
        },
      ),
    ],
  );

  static CustomTransitionPage<void> _buildPageWithTransition(GoRouterState state, Widget page) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: page,
      barrierDismissible: true,
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static GoRouter get router => _router;
}
