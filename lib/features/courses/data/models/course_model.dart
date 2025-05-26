import 'package:droosy_app/features/courses/data/models/lesson_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String descripton;
  final String imageUrl;
  final String categoryId;
  final double price;
  final List<LessonModel> lessons;
  final double rating;
  final int ratingCount;
  final int enrollmentCount;
  final String level;
  final List<String> requirements;
  final List<String> whatYouWillLearn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPremium;

  CourseModel({
    required this.id,
    required this.title,
    required this.descripton,
    required this.imageUrl,
    required this.categoryId,
    required this.price,
    required this.lessons,
    this.rating = 0,
    this.ratingCount = 0,
    this.enrollmentCount = 0,
    required this.level,
    required this.requirements,
    required this.whatYouWillLearn,
    required this.createdAt,
    required this.updatedAt,
    this.isPremium = false,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      descripton: json['description'],
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      price: json['price'].toDouble(),
      rating: json['rating'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
      enrollmentCount: json['enrollmentCount'] ?? 0,
      lessons:
          (json['lessons'] as List)
              .map((lesson) => LessonModel.fromJson(lesson))
              .toList(),
      level: json['level'],
      requirements: List<String>.from(json['requirements']),
      whatYouWillLearn: List<String>.from(json['whatYouWillLearn']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isPremium: json['isPremium'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': descripton,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'price': price,
      'rating': rating,
      'ratingCount': ratingCount,
      'enrollmentCount': enrollmentCount,
      'lessons': lessons.map((lesson) => lesson.toJson()).toList(),
      'level': level,
      'requirements': requirements,
      'whatYouWillLearn': whatYouWillLearn,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isPremium': isPremium,
    };
  }
}
