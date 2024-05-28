import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (c, i) => const _ChatHistoryItem('Chatbot definition expl'),
      separatorBuilder: (c, i) => const SizedBox(height: 8),
      itemCount: 1,
    );
  }
}

class _ChatHistoryItem extends StatelessWidget {
  const _ChatHistoryItem(this.label);

  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xff343540),
        ),
        padding: const EdgeInsets.only(
          left: 14,
          right: 10,
          top: 16,
          bottom: 16,
        ),
        height: 45,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              width: 12,
              height: 13,
              child: Assets.svg.message.svg(),
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 13.5,
                    height: 0,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 6, right: 12),
                width: 12,
                height: 13,
                child: Assets.svg.edit.svg()),
            SizedBox(
              width: 12,
              height: 13,
              child: Assets.svg.delete.svg(),
            ),
          ],
        ),
      ),
    );
  }
}
