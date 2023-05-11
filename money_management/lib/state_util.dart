import 'package:flutter/material.dart';

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static get currentContext {
    return navigatorKey.currentContext;
  }
  static to(Widget page) async {
    await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
  static back() {
    navigatorKey.currentState!.pop(currentContext);
  }
}

