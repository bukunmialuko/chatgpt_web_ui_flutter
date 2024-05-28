import 'package:chatgpt_web_ui/features/main/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/ai_chat_widget.dart';
import 'package:chatgpt_web_ui/features/main/widgets/chat/human_chat_widget.dart';
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
              itemCount: 2,
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              left: screeWidth * 0.08,
              right: screeWidth * 0.08,
              top: 8,
              bottom: 24,
            ),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                fillColor: const Color(0xff40414E),
                labelStyle: TextStyle(),
                labelText: '',
                suffixIcon: Assets.svg.send.svg(),
              ),
              style: TextStyle(),
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
