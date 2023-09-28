import 'package:auto_route/auto_route.dart';
import 'package:budz/src/view/views/journey_page.dart';

import '../../domain/models/user.dart';
import '../../view/views/chatbot_page.dart';
import '../../view/views/delete_feedback_page.dart';
import '../../view/views/feedback_page.dart';
import '../../view/views/home_page.dart';
import '../../view/views/main_page.dart';
import '../../view/views/profile_detail_page.dart';
import '../../view/views/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProfileDetailRoute.page),
        AutoRoute(page: DeleteFeedbackRoute.page),
        AutoRoute(page: FeedbackRoute.page),
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: JourneyRoute.page),
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ChatbotRoute.page),
          ],
        ),
      ];
}
