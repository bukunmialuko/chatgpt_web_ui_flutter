import 'package:chatgpt_web_ui/features/chat/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/ai_chat_widget.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/human_chat_widget.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/start_chat_default_widget.dart';
import 'package:chatgpt_web_ui/features/home/widgets/chat/chat_area.dart';
import 'package:flutter/material.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return chats.isEmpty
        ? const StartChatDefaultWidget()
        : ListView.builder(
            itemBuilder: (c, i) => chats[i] is HumanChatModel
                ? HumanChatWidget(
                    chatModel: chats[i],
                  )
                : AiChatWidget(
                    chatModel: chats[i],
                  ),
            itemCount: chats.length,
          );
  }
}
