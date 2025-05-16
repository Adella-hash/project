import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation/app_router.dart';
import 'navigation/bottom_navigation.dart';

import 'bloc/profile_bloc/profile_bloc.dart';
import 'bloc/profile_bloc/profile_event.dart';
import 'bloc/settings_bloc/settings_bloc.dart';
import 'bloc/settings_bloc/settings_event.dart';
import 'bloc/settings_bloc/settings_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Получение данных из SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  String language = prefs.getString('language') ?? 'ru';

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    isDarkMode: isDarkMode,
    language: language,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool isDarkMode;
  final String language;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.isDarkMode,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc()..add(LoadProfile()),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()
            ..add(ToggleThemeEvent(isDarkMode))
            ..add(ChangeLanguageEvent(language)),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          bool darkMode = state is SettingsUpdated ? state.isDarkMode : isDarkMode;
          String currentLanguage = state is SettingsUpdated ? state.language : language;

          return MaterialApp(
            title: 'Food Point',
            theme: ThemeData(
              brightness: darkMode ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.orange,
              textTheme: GoogleFonts.robotoTextTheme(),
            ),
            initialRoute: isLoggedIn ? '/main' : '/login',
            onGenerateRoute: AppRouter.generateRoute,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // Английский
              Locale('ru'), // Русский
              Locale('kk'), // Казахский
            ],
            locale: Locale(currentLanguage),
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            home: const BottomNavigation(),
          );
        },
      ),
    );
  }

  static of(BuildContext context) {}
}
