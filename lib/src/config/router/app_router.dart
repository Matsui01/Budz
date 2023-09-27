import 'package:auto_route/auto_route.dart';

import '../../view/views/home_page.dart';
import '../../view/views/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProfileRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        /*
         children: const [
          // AutoRoute(page: EmployeersRelationshipRoute.page),
          // AutoRoute(page: EmployeesRoute.page),
          // AutoRoute(page: ProfileRoute.page),
          // AutoRoute(page: DeliverySheetRoute.page),
        ]
        */
      ];
}
