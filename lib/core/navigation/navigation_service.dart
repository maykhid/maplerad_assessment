import 'package:flutter/material.dart';

class NavigationService {

  NavigationService._internal();

  static final NavigationService instance = NavigationService._internal();

  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() => _navigationKey.currentState?.pop();

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) =>
      _navigationKey.currentState?.pushNamed(routeName, arguments: arguments);

  Future<dynamic>? navigateToRoute(Widget route) =>
      _navigationKey.currentState?.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => route,
        ),
      );

  Future<dynamic>? popAndPushNamed(String routeName, {dynamic arguments}) =>
      _navigationKey.currentState?.popAndPushNamed(routeName, arguments: arguments);

  Future<bool>? maybePop() => _navigationKey.currentState?.maybePop();
}

