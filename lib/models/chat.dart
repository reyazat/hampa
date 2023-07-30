enum MessageType { incoming, outgoing }

class ChatModel {
  final String fullName;
  final String avatarUrl;
  final String lastSeen;
  List<MessageModel> messages;

  ChatModel({
    required this.fullName,
    required this.avatarUrl,
    required this.messages,
    this.lastSeen = '',
  });
}

class MessageModel {
  final String content;
  final DateTime timestamp;
  final bool? seen;
  final MessageType type;

  MessageModel({
    required this.content,
    required this.timestamp,
    required this.type,
    this.seen,
  });
}
