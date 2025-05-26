class QuestionModel {
  final String id;
  final String text;
  final String correctOptionId;
  final List<OptionModel> options;
  final int points;

  QuestionModel({
    required this.id,
    required this.text,
    required this.correctOptionId,
    required this.options,
    required this.points,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      correctOptionId: json['correctOptionId'] ?? '',
      options:
          (json['options'] as List)
              .map((option) => OptionModel.fromJson(option))
              .toList(),
      points: json['points'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'correctOptionId': correctOptionId,
    'options': options.map((option) => option.toJson()).toList(),
    'points': points,
  };
}

class OptionModel {
  final String id;
  final String text;

  OptionModel({required this.id, required this.text});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(id: json['id'] ?? '', text: json['text'] ?? '');
  }

  Map<String, dynamic> toJson() => {'id': id, 'text': text};
}
