import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;

  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  NavigationService._internal();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  pop() => _navigationKey.currentState!.pop();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) =>
      _navigationKey.currentState!.pushNamed(routeName, arguments: arguments);

  Future<dynamic> navigateToRoute(Widget route) =>
      _navigationKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => route,
        ),
      );

  Future<dynamic> popAndPushNamed(String routeName) =>
      _navigationKey.currentState!.popAndPushNamed(routeName);

  Future<bool> maybePop() => _navigationKey.currentState!.maybePop();
}
