import 'package:chatgpt_web_ui/features/home/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeskTopHomePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DeskTopHomePage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              const SideMenu(),
              Expanded(child: navigationShell),
            ],
          ),
        ),
      ),
    );
  }
}
