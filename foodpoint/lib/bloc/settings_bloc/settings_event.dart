abstract class SettingsEvent {}

class ToggleThemeEvent extends SettingsEvent {
  final bool isDarkMode;
  ToggleThemeEvent(this.isDarkMode);
}

class ChangeLanguageEvent extends SettingsEvent {
  final String language;
  ChangeLanguageEvent(this.language);
}
