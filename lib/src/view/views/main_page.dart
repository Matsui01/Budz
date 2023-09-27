import 'package:auto_route/auto_route.dart';
import 'package:budz/src/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../config/router/app_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        JourneyRoute(),
        ChatbotRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          backgroundColor: AppColor.background,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (int index) {
              tabsRouter.setActiveIndex(index);
            },
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home_filled, color: AppColor.primary),
                icon: Icon(Icons.home_filled),
                label: 'Início',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.grid_view_outlined, color: AppColor.primary),
                icon: Icon(Icons.grid_view_outlined),
                label: 'Jornadas',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.sms_outlined, color: AppColor.primary),
                icon: Icon(Icons.sms_outlined),
                label: 'Chatbot',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person, color: AppColor.primary),
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        );
      },
    );
  }
}
