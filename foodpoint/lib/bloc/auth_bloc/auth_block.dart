import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // Выполняем вход через Firebase
        await Future.delayed(Duration(seconds: 1)); // Заменить на Firebase Auth
        emit(AuthAuthenticated());
      } catch (e) {
        emit(AuthError('Ошибка входа'));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // Выполняем регистрацию через Firebase
        await Future.delayed(Duration(seconds: 1)); // Заменить на Firebase Auth
        emit(AuthAuthenticated());
      } catch (e) {
        emit(AuthError('Ошибка регистрации'));
      }
    });

    on <LogoutRequested>((event, emit) async {
      // Логаут через Firebase
      emit(AuthUnauthenticated());
    });
  }
  
  
}
