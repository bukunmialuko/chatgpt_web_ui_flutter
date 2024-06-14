import 'dart:math';

import 'package:chatgpt_web_ui/features/chat/model/chat_model.dart';
import 'package:chatgpt_web_ui/features/chat/notifier/chat/lorem_ipsums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_notifier.g.dart';

@riverpod
class ChatNotifier extends _$ChatNotifier {
  final Random _random = Random();

  @override
  List<ChatModel> build() {
    return [];
  }

  void sendChat(HumanChatModel model) {
    final previousState = state;
    int randomIndex = _random.nextInt(loremIpsum.length);
    final randomAiMessage = AiChatModel(loremIpsum[randomIndex]);

    state = [...previousState, model, randomAiMessage];
  }
}
