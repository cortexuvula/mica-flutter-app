import 'package:flutter/material.dart';

class NavigationHelper {
  static Route<T> fadeRoute<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation.drive(
            CurveTween(curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 1000),
    );
  }

  static Future<T?> navigateTo<T>(BuildContext context, Widget page) {
    return Navigator.push<T>(
      context,
      fadeRoute<T>(page),
    );
  }

  static Future<T?> navigateAndReplace<T>(BuildContext context, Widget page) {
    return Navigator.pushReplacement<T, void>(
      context,
      fadeRoute<T>(page),
    );
  }

  static Future<T?> navigateAndRemoveUntil<T>(
    BuildContext context,
    Widget page,
    RoutePredicate predicate,
  ) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      fadeRoute<T>(page),
      predicate,
    );
  }
}
