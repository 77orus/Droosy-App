class ChatMessageModel {
  final String id;
  final String message;
  final String senderId;
  final String courseId;
  final String receiverId;
  final DateTime timestamp;
  final bool isRead;

  ChatMessageModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.courseId,
    required this.receiverId,
    required this.timestamp,
    required this.isRead,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      message: json['message'],
      senderId: json['senderId'],
      courseId: json['courseId'],
      receiverId: json['receiverId'],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'message': message,
    'senderId': senderId,
    'courseId': courseId,
    'receiverId': receiverId,
    'timestamp': timestamp.toIso8601String(),
    'isRead': isRead,
  };
}
