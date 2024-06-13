import 'package:chatgpt_web_ui/features/main/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/ai_chat_widget.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/chat_area.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/human_chat_widget.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/start_chat_default_widget.dart';
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
