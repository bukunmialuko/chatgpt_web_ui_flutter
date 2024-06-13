import 'package:chatgpt_web_ui/features/main/widgets/side_menu/side_menu.dart';
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
    return SelectionArea(
      child: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              const SideMenu(),
              Expanded(child: widget.navigationShell),
            ],
          ),
        ),
      ),
    );
  }
}
