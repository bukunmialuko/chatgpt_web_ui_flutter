import 'dart:async';

import 'package:chatgpt_web_ui/navigation/app_router.dart';
import 'package:chatgpt_web_ui/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const App());
  }, (error, stackTrace) {
    debugPrint(stackTrace.toString());
    debugPrint(error.toString());
  });
}

GoRouter appRouter = const AppRouter().createApplicationRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => 'Chat GPT UI-Kit',
      theme: appThemeData(),
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: (_, child) => child!,
    );
  }
}
