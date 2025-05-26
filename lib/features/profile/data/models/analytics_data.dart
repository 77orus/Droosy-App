class AnalyticsData {
  final double completionRate;
  final int totalTimeSpent;
  final double averageQuizScore;
  final Map<String, double> skillProgress;
  final List<String> recommendations;
  final List<WeeklyProgress> weeklyProgresses; // Add this line
  final Map<String, int> learningStreak;
  final int totlaCourseEnrolled;
  final int certificatesEarned;

  AnalyticsData({
    required this.completionRate,
    required this.totalTimeSpent,
    required this.averageQuizScore,
    required this.skillProgress,
    required this.recommendations,
    required this.weeklyProgresses,
    required this.learningStreak,
    required this.totlaCourseEnrolled,
    required this.certificatesEarned,
  });

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      completionRate: json['completionRate'] ?? 0.0,
      totalTimeSpent: json['totalTimeSpent'] ?? 0,
      averageQuizScore: json['averageQuizScore'] ?? 0.0,
      skillProgress: Map<String, double>.from(json['skillProgress']),
      recommendations: List<String>.from(json['recommendations']),
      weeklyProgresses: List<WeeklyProgress>.from(
        json['weeklyProgresses'].map(
          (progress) => WeeklyProgress(
            day: progress['day'],
            minutes: progress['minutes'],
          ),
        ),
      ),
      learningStreak: Map<String, int>.from(json['learningStreak']),
      totlaCourseEnrolled: json['totlaCourseEnrolled'] ?? 0,
      certificatesEarned: json['certificatesEarned'] ?? 0,
    );
  }
}

class WeeklyProgress {
  final String day;
  final int minutes;

  WeeklyProgress({required this.day, required this.minutes});
}
