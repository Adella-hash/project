import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// События профиля
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String username;
  final String email;
  final String nickname;

  UpdateProfile({
    required this.username,
    required this.email,
    required this.nickname,
  });

  @override
  List<Object?> get props => [username, email, nickname];
}

// Состояния профиля
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String username;
  final String email;
  final String nickname;

  ProfileLoaded({
    required this.username,
    required this.email,
    required this.nickname,
  });

  @override
  List<Object?> get props => [username, email, nickname];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC профиля
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      // Загрузка данных профиля (имитация)
      await Future.delayed(const Duration(seconds: 1));
      emit(ProfileLoaded(
        username: 'Лира',
        email: 'lira@foodpoint.com',
        nickname: 'Lira123',
      ));
    } catch (e) {
      emit(ProfileError('Не удалось загрузить профиль'));
    }
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    emit(ProfileLoaded(
      username: event.username,
      email: event.email,
      nickname: event.nickname,
    ));
  }
}
