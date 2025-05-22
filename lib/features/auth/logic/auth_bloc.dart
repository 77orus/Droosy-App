import 'package:droosy_app/features/auth/logic/auth_event.dart';
import 'package:droosy_app/features/auth/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthChangeState>(_onAuthChangeState);
    on<RegisterRequestEvent>(_onRegisterRequestEvent);
    on<LoginRequestEvent>(_onLoginRequestEvent);
    on<LogoutRequestEvent>(_onLogoutRequestEvent);
    on<ForgotPasswordRequestEvent>(_onForgotPasswordRequestEvent);
    on<UpdateProfileRequestEvent>(_onUpdateProfileRequestEvent);
  }

  Future<void> _onAuthChangeState(
    AuthChangeState event,
    Emitter<AuthState> emit,
  ) async {
    // Todo:: Implement Authentication statce changes
    emit(AuthState());
  }

  Future<void> _onRegisterRequestEvent(
    RegisterRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Todo:: Implement Registration Logic,
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onLoginRequestEvent(LoginRequestEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Todo:: Implement Login Logic,
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onLogoutRequestEvent(LogoutRequestEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Todo:: Implement Logout Logic,
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onForgotPasswordRequestEvent(ForgotPasswordRequestEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Todo:: Implement Forgot Password Logic,
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onUpdateProfileRequestEvent(UpdateProfileRequestEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Todo:: Implement Update Profile Logic,
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
