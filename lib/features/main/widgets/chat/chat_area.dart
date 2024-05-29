import 'package:chatgpt_web_ui/features/main/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/ai_chat_widget.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/human_chat_widget.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/regenerate_response.dart';
import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ChatArea extends StatefulWidget {
  const ChatArea({super.key});

  @override
  State<ChatArea> createState() => _ChatAreaState();
}

final List<ChatModel> chats = [
  HumanChatModel('What is a Chatbot?'),
  AiChatModel(
      'A chatbot is a computer program that simulates human conversation through voice commands or text chats or both. It can be integrated with various messaging platforms like Facebook Messenger, WhatsApp, WeChat, etc. and can be used for a variety of purposes, such as customer service, entertainment, and e-commerce.'),
];

class _ChatAreaState extends State<ChatArea> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.middle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (c, i) => chats[i] is HumanChatModel
                  ? HumanChatWidget(
                      chatModel: chats[i],
                    )
                  : AiChatWidget(
                      chatModel: chats[i],
                    ),
              itemCount: chats.length,
            ),
          ),
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
                  child: Assets.svg.sendChat.svg(),
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
          Container(
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
          ),
        ],
      ),
    );
  }
}
