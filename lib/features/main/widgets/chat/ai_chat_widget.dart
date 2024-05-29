import 'package:chatgpt_web_ui/features/main/model/chat_model.dart';
import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AiChatWidget extends StatelessWidget {
  final ChatModel chatModel;

  const AiChatWidget({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.bright,
      padding: EdgeInsets.only(
        left: screeWidth * 0.08,
        right: screeWidth * 0.08,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 26,
          bottom: 26,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 30, height: 30, child: Assets.svg.chatGpt.svg()),
            const SizedBox(width: 26),
            Expanded(
              child: Text(
                chatModel.message,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                ),
              ),
            ),
            _ActionButton(
              margin: const EdgeInsets.only(left: 16, right: 7),
              icon: Assets.svg.like.svg(),
              onTap: () {},
            ),
            _ActionButton(
              margin: const EdgeInsets.only(left: 7, right: 7),
              icon: Assets.svg.dislike.svg(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton(
      {required this.margin, required this.icon, required this.onTap});

  final EdgeInsets margin;
  final Widget icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 14,
        height: 14,
        margin: margin,
        child: icon,
      ),
    );
  }
}
