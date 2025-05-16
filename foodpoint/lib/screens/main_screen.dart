import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodpoint/main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();
    _tabs.add(_buildCategoriesTab() as Widget);
    _tabs.add(const PlaceholderScreen(title: 'Профиль'));
    _tabs.add(const PlaceholderScreen(title: 'Настройки'));
  }

  void _changeLanguage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.russian ?? 'Russian'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  Locale newLocale = const Locale('ru');
                  MyApp.of(context)?.setLocale(newLocale);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.english ?? 'English'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  Locale newLocale = const Locale('en');
                  MyApp.of(context)?.setLocale(newLocale);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.kazakh ?? 'Kazakh'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  Locale newLocale = const Locale('kk');
                  MyApp.of(context)?.setLocale(newLocale);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      AppLocalizations.of(context)!.main,
      AppLocalizations.of(context)!.profile,
      AppLocalizations.of(context)!.settings,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _changeLanguage(context),
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: titles[0]),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: titles[1]),
          BottomNavigationBarItem(icon: const Icon(Icons.settings), label: titles[2]),
        ],
      ),
    );
  }
}

extension on AppLocalizations {
  get main => null;
  
  String? get russian => null;
  
  String? get english => null;
  
  String? get kazakh => null;
  
  get profile => null;
  
  get settings => null;
}

class _buildCategoriesTab {
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, style: const TextStyle(fontSize: 24)));
  }
}
