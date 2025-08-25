import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_live_chat/app.dart';

/// Push screen on TabBar
class NexNavigate {
  static GoRouter get _rootNavigator => GoRouter.of(App.appNavigateKey.currentContext!);

  static GoRouter get _navigator => _rootNavigator;

  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
    BuildContext? context,
    bool forceRootNavigator = false,
  }) {
    return _effectiveNavigator(context: context, forceRouteNavigator: forceRootNavigator).push(routeName, extra: arguments);
  }

  static Future pushReplacementNamed(String routeName, {Object? arguments, BuildContext? context, bool forceRootNavigator = false}) {
    return _effectiveNavigator(context: context, forceRouteNavigator: forceRootNavigator).pushReplacement(routeName, extra: arguments);
  }

  static Future pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
    BuildContext? context,
    bool forceRootNavigator = false,
  }) {
    return _effectiveNavigator(context: context, forceRouteNavigator: forceRootNavigator).push(routeName, extra: arguments);
  }

  static Future<dynamic> push(String routePath, {Object? arguments, bool forceRootNavigator = false, BuildContext? context}) {
    return _effectiveNavigator(context: context, forceRouteNavigator: forceRootNavigator).push(routePath, extra: arguments);
  }

  static void go(String routePath, {Object? arguments, bool forceRootNavigator = false, BuildContext? context}) {
    return _effectiveNavigator(context: context, forceRouteNavigator: forceRootNavigator).go(routePath, extra: arguments);
  }

  static void pop({bool forceRootNavigator = false, BuildContext? context, Object? result}) {
    return _effectiveNavigator(context: context, forceRouteNavigator: forceRootNavigator).pop(result);
  }

  static void popTimes({bool forceRootNavigator = false, BuildContext? context, Object? result, required int times}) {
    while (times > 0) {
      _navigator.pop(result);
      times--;
    }
  }

  static GoRouter _effectiveNavigator({BuildContext? context, bool forceRouteNavigator = false}) {
    if (forceRouteNavigator) {
      return _rootNavigator;
    }
    if (context != null) {
      return GoRouter.of(context);
    }
    return _navigator;
  }
}
