import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  /// Pushes a new route onto the stack.
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute<T>(
        builder: (context) => page,
      ),
    );
  }

  /// Replaces the current route with a new one.
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Widget page) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute<T>(
        builder: (context) => page,
      ),
    );
  }

  Future<T?> pushRemoveAll<T extends Object?>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute<T>(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
