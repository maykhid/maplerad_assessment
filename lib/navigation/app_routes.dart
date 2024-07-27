import 'package:go_router/go_router.dart';
import 'package:maplerad_assessment/screens/home.dart';
import 'package:maplerad_assessment/screens/passcode.dart';


class AppRoutes {
  static List<GoRoute> routes = [
    
    GoRoute(
      path: '/',
      name: 'passcode',
      builder: (context, state) => const PasscodeScreen(),
    ),

    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    
  ];
}
