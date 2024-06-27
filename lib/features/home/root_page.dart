import 'package:chatgpt_web_ui/features/home/responsive/desktop_home_page.dart';
import 'package:chatgpt_web_ui/features/home/responsive/mobile_home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const RootPage({super.key, required this.navigationShell});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DeskTopHomePage(
            navigationShell: widget.navigationShell,
          );
        } else {
          return MobileHomePage(
            navigationShell: widget.navigationShell,
          );
        }
      },
    );
  }
}
