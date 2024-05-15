import 'package:chatgpt_web_ui/features/home/root_page.dart';
import 'package:chatgpt_web_ui/features/login/login_screen.dart';
import 'package:chatgpt_web_ui/features/main/main_screen.dart';
import 'package:chatgpt_web_ui/features/splash/splash_screen.dart';
import 'package:chatgpt_web_ui/features/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  const AppRouter();

  GoRouter createApplicationRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return RootPage(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/main',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: MainScreen()),
                ),
              ],
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) async {
        return null;
      },
      errorBuilder: (context, __) {
        return Container();
      },
    );
  }
}
