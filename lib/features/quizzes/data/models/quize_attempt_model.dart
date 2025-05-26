class QuizeAttemptModel {
  final String? id;
  final String? quizeId;
  final String? userId;
  final int? score;
  final Map<String, String>? answers;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int? timeSpent;

  QuizeAttemptModel({
    required this.id,
    required this.quizeId,
    required this.userId,
    required this.score,
    required this.answers,
    required this.startedAt,
    this.completedAt,
    required this.timeSpent,
  });

  factory QuizeAttemptModel.fromJson(Map<String, dynamic> json) =>
      QuizeAttemptModel(
        id: json['id'] as String? ?? '',
        quizeId: json['quizeId'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        score: json['score'] as int? ?? 0,
        answers: Map<String, String>.from(json['answers'] ?? {}),
        startedAt: DateTime.parse(json['startedAt']),
        completedAt:
            json['completedAt'] != null
                ? DateTime.parse(json['completedAt'])
                : null,
        timeSpent: json['timeSpent'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'quizeId': quizeId,
    'userId': userId,
    'score': score,
    'answers': answers,
    'startedAt': startedAt?.toIso8601String(),
    'completedAt': completedAt?.toIso8601String(),
    'timeSpent': timeSpent,
  };
}
