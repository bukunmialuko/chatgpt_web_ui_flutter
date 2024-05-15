import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String label;
  final Widget icon;
  const SocialAuthButton({
    super.key,
    this.width = 320,
    this.height = 52,
    required this.onPressed,
    required this.label, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffC3C8CF)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        icon: icon,
        label: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: const Color(0xff2E3339),
              fontFamily: Assets.fonts.inter.interMedium,
            ),
          ),
        ),
      ),
    );
  }
}
