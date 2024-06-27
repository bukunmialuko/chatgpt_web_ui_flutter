import 'package:chatgpt_web_ui/features/chat/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/chat/notifier/chat/chat_notifier.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/conversations_widget.dart';
import 'package:chatgpt_web_ui/features/chat/widgets/regenerate_response.dart';
import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatArea extends ConsumerStatefulWidget {
  const ChatArea({super.key});

  @override
  ConsumerState<ChatArea> createState() => _ChatAreaState();
}

class _ChatAreaState extends ConsumerState<ChatArea> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.middle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: ConversationsWidget()),
          const RegenerateResponseWidget(),
          Container(
            height: 48,
            // color: Colors.white,
            margin: EdgeInsets.only(
              left: screeWidth * 0.08,
              right: screeWidth * 0.08,
              top: 8,
              bottom: 24,
            ),
            child: TextField(
              controller: _textController,
              style: const TextStyle(color: AppColors.white, height: 1),
              maxLines: 3,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                sendChat();
              },
              decoration: InputDecoration(
                labelText: '',
                filled: true,
                fillColor: const Color(0xff40414E),
                suffixIcon: Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    left: 16,
                    right: 13,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      sendChat();
                    },
                    child: Assets.svg.sendChat.svg(),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff303139)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff303139)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff303139)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.redAccent),
                ),
              ),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 380) {
              return const SizedBox.shrink();
            }
            return Container(
              margin: EdgeInsets.only(
                left: screeWidth * 0.04,
                right: screeWidth * 0.04,
                top: 8,
                bottom: 24,
              ),
              child: const Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Don\'t have an account? ',
                  children: [
                    TextSpan(
                      text:
                          '''ree Research Preview. Our goal is to make AI systems more natural and safe to interact with. Your feedback will help us improve.''',
                      style: TextStyle(
                        color: AppColors.greyFootprint,
                        fontSize: 12,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: AppColors.greyFootprint,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  void sendChat() {
    ref
        .read(chatNotifierProvider.notifier)
        .sendChat(HumanChatModel(_textController.value.text));
    _textController.clear();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
