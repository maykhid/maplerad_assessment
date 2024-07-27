import 'package:go_router/go_router.dart';
import 'package:maplerad_assessment/navigation/app_routes.dart';


class AppRouterConfig {
  static GoRouter get goRouter => GoRouter(
        routes: AppRoutes.routes,
      );
}
