import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animationController
      ..forward()
      ..addStatusListener(animationListener);
  }

  void animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      context.go('/open-ai-chat');
    }
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.middle,
      body: Center(
        child: SizedBox(
            width: 120,
            child: Assets.svg.logo.svg()),
      ),
    );
  }
}
