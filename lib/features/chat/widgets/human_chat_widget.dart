import 'package:chatgpt_web_ui/features/chat/model/chat_model.dart';
import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HumanChatWidget extends StatelessWidget {
  final ChatModel chatModel;
  const HumanChatWidget({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        left: screeWidth * 0.08,
        right: screeWidth * 0.08,
      ),
      padding: const EdgeInsets.only(
        top: 26,
        bottom: 26,
        right: 70,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 30, height: 30, child: Assets.svg.user.svg()),
          const SizedBox(width: 26),
          Expanded(
            child: Text(
              chatModel.message,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
