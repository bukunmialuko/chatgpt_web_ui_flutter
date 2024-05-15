import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.middle,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 39,
              height: 39.53,
              child: Assets.svg.logo.svg(),
            ),
            const SizedBox(height: 19),
            Text(
              "Welcome to ChatGPT",
              style: _getTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              "Log in with your OpenAI account to continue",
              style: _getTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getButton(
                  onPressed: () {},
                  label: 'Log in',
                ),
                const SizedBox(width: 12),
                _getButton(
                  onPressed: () {},
                  label: 'Sign up',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _getTextStyle => TextStyle(
        fontSize: 15,
        color: AppColors.white,
        fontFamily: Assets.fonts.inter.interMedium,
      );

  Widget _getButton({required String label, required VoidCallback onPressed}) =>
      FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accentGreen,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          label,
          style: _getTextStyle,
        ),
      );
}
