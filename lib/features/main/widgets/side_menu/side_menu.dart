import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      width: 261,
      child: const Padding(
        padding: EdgeInsets.only(left: 8, right: 9, top: 9),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
