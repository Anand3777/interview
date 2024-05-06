import 'package:crewmeister/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:crewmeister/features/landing/presentation/landing_page.dart';
import 'package:crewmeister/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  landing,
  dashboard,
}

// final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}


final goRouter = GoRouter(
  initialLocation: '/${AppRoute.splash.name}',
  navigatorKey: NavigationService.navigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/${AppRoute.splash.name}',
      name: AppRoute.splash.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashPage(),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.landing.name}',
      name: AppRoute.landing.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: LandingPage(),
      ),
    ),
    GoRoute(
      path: '/${AppRoute.dashboard.name}',
      name: AppRoute.dashboard.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: DashboardPage(),
      ),
    ),
  ],
);
