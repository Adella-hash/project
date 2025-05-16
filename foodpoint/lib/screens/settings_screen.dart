import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc/settings_bloc.dart';
import '../bloc/settings_bloc/settings_event.dart';
import '../bloc/settings_bloc/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _changeLanguage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Русский'),
              onTap: () {
                Navigator.pop(context);
                context.read<SettingsBloc>().add(ChangeLanguageEvent('Русский'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Язык установлен: Русский')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              onTap: () {
                Navigator.pop(context);
                context.read<SettingsBloc>().add(ChangeLanguageEvent('English'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Language set: English')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Қазақша'),
              onTap: () {
                Navigator.pop(context);
                context.read<SettingsBloc>().add(ChangeLanguageEvent('Қазақша'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Тіл орнатылды: Қазақша')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final isDarkMode = state is SettingsUpdated ? state.isDarkMode : false;
          final language = state is SettingsUpdated ? state.language : 'Русский';

          return ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Язык'),
                subtitle: Text('Текущий язык: $language'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => _changeLanguage(context),
              ),
              SwitchListTile(
                title: const Text('Тёмная тема'),
                subtitle: const Text('Переключить светлую/тёмную тему'),
                value: isDarkMode,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(ToggleThemeEvent(value));
                },
                secondary: const Icon(Icons.brightness_6),
              ),
            ],
          );
        },
      ),
    );
  }
}
