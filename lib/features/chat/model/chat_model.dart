abstract class ChatModel {
  final String message;

  ChatModel(this.message);
}

class HumanChatModel extends ChatModel {
  HumanChatModel(super.message);
}

class AiChatModel extends ChatModel {
  AiChatModel(super.message);
}
