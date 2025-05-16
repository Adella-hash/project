import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<SettingsState> emit) {
    emit(SettingsUpdated(event.isDarkMode, state is SettingsUpdated ? (state as SettingsUpdated).language : 'Русский'));
  }

  void _onChangeLanguage(ChangeLanguageEvent event, Emitter<SettingsState> emit) {
    emit(SettingsUpdated(state is SettingsUpdated ? (state as SettingsUpdated).isDarkMode : false, event.language));
  }
}
