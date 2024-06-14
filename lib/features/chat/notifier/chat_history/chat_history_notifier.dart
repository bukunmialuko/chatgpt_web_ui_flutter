import 'package:chatgpt_web_ui/features/chat/model/chat_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_history_notifier.g.dart';

@riverpod
class ChatHistoryNotifier extends _$ChatHistoryNotifier {
  @override
  List<ChatModel> build() {
    return [];
  }
}
