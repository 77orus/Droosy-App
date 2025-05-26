import 'package:droosy_app/features/courses/data/models/question_model.dart';

class QuizeModel {
  final String id;
  final String title;
  final String description;
  final int timeLimit;
  final List<QuestionModel> questions;
  final DateTime createdAt;
  final bool isActive;

  QuizeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timeLimit,
    required this.questions,
    required this.createdAt,
    this.isActive = true,
  });

  factory QuizeModel.fromJson(Map<String, dynamic> json) => QuizeModel(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    timeLimit: json['timeLimit'] ?? 30,
    questions: List<QuestionModel>.from(
      json['questions'].map((question) => QuestionModel.fromJson(question)),
    ),
    createdAt: DateTime.parse(json['createdAt']),
    isActive: json['isActive'] ?? true,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'timeLimit': timeLimit,
    'questions': questions.map((question) => question.toJson()).toList(),
    'createdAt': createdAt.toIso8601String(),
    'isActive': isActive,
  };
}
