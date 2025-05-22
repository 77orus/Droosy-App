import 'package:droosy_app/features/auth/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final UserModel? userModel;
  final bool isLoading;
  final String? errorMessage;

  

  const AuthState({
     this.userModel,
     this.isLoading = false,
     this.errorMessage,
  });

  AuthState copyWith({
    UserModel? userModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      userModel: userModel ?? this.userModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [userModel, isLoading, errorMessage];

}
