import 'package:droosy_app/features/auth/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthChangeState extends AuthEvent {
  final UserModel user;

  const AuthChangeState({required this.user});

  @override
  List<Object?> get props => [user];
}

class RegisterRequestEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final UserRole role;

  const RegisterRequestEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
  });

  @override
  List<Object?> get props => [email, password, fullName, role];
}

class LoginRequestEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginRequestEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutRequestEvent extends AuthEvent {}

class ForgotPasswordRequestEvent extends AuthEvent {
  final String email;

  const ForgotPasswordRequestEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class UpdateProfileRequestEvent extends AuthEvent {
  final String fullName;
  final String photoUrl;

  const UpdateProfileRequestEvent({required this.fullName, required this.photoUrl});

  @override
  List<Object?> get props => [fullName, photoUrl];
}
