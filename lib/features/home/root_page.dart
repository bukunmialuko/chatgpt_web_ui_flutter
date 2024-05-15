import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const RootPage({super.key, required this.navigationShell});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.middle,
        appBar: AppBar(
          backgroundColor: AppColors.middle,
          title: const Text(
            "BRITCARE",
            style: TextStyle(color: AppColors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon:  const Icon(Icons.abc),
            onPressed: () {
              _openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        body: widget.navigationShell,
        // drawer: DrawerWidget(
        //   selected: _calculateCurrentIndex(context),
        // ),
      ),
    );
  }

  void _openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  static int _calculateCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/open-ai-chat')) {
      return 0;
    }
    if (location.startsWith('/bio-mistral-chat')) {
      return 1;
    }

    return 0;
  }
}
