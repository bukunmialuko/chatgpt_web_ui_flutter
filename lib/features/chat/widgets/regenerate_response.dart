import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class RegenerateResponseWidget extends StatelessWidget {
  const RegenerateResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 14, right: 14),
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: AppColors.bright),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 11,
                height: 11,
                child: Assets.svg.refresh.svg(),
              ),
              const SizedBox(width: 14),
              const Text(
                'Regenerate response',
                style: TextStyle(
                  color: AppColors.greyIcons,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
