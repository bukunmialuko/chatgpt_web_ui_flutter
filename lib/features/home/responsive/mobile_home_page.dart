import 'package:chatgpt_web_ui/features/home/widgets/side_menu/side_menu.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.middle,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
      ),
      drawer: const Drawer(child: SideMenu()),
      body: navigationShell,
    );
  }
}
