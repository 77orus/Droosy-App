import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String fullName;
  final String email;
  final String? phone;
  final String? image;
  final String? bio;
  final ProfileState profileState;

  const ProfileModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.image,
    required this.bio,
    required this.profileState,
  });

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? image,
    String? bio,
    ProfileState? profileState,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      bio: bio ?? this.bio,
      profileState: profileState ?? this.profileState,
    );
  }

  @override
  List<Object?> get props => [fullName, email, phone, image, bio, profileState];
}

class ProfileState extends Equatable {
  final int coursesCount;
  final int hoursSpent;
  final String successRate;

  const ProfileState({
    required this.coursesCount,
    required this.hoursSpent,
    required this.successRate,
  });

  @override
  List<Object?> get props => [coursesCount, hoursSpent, successRate];
}
