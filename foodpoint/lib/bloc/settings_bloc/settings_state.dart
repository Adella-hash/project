abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final bool isDarkMode;
  final String language;

  SettingsInitial({this.isDarkMode = false, this.language = 'Русский'});
}

class SettingsUpdated extends SettingsState {
  final bool isDarkMode;
  final String language;

  SettingsUpdated(this.isDarkMode, this.language);
}
