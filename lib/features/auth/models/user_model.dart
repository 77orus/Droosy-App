class UserModel {
  final String uid;
  final String email;
  final String password;
  final String? fullName;
  final String? photoUrl;
  final UserRole role;
  final DateTime createdAt;
  final DateTime lastLoginAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    this.fullName,
    this.photoUrl,
    required this.role,
    required this.createdAt,
    required this.lastLoginAt,
  });
}

enum UserRole { student, teacher }
