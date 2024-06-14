import 'package:chatgpt_web_ui/features/chat/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/chat/notifier/chat/chat_notifier.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/ai_chat_widget.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/human_chat_widget.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/start_chat_default_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationsWidget extends ConsumerWidget {
  const ConversationsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatNotifierProvider);
    return messages.isEmpty
        ? const StartChatDefaultWidget()
        : ListView.builder(
            itemBuilder: (c, i) => messages[i] is HumanChatModel
                ? HumanChatWidget(
                    chatModel: messages[i],
                  )
                : AiChatWidget(
                    chatModel: messages[i],
                  ),
            itemCount: messages.length,
          );
  }
}
