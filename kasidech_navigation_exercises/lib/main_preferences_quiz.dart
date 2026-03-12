import 'package:flutter/material.dart';
import 'package:kasidech_navigation_exercises/main_navigation_quiz_cover.dart';
import 'package:kasidech_navigation_exercises/main_navigation_quiz_result.dart';
import 'package:kasidech_navigation_exercises/screens/profile_screen.dart';
import 'package:kasidech_navigation_exercises/screens/quiz_screen.dart';
import 'package:kasidech_navigation_exercises/screens/quiz_screen_home.dart';
import 'package:kasidech_navigation_exercises/screens/settings_screen.dart';
import 'package:kasidech_navigation_exercises/states/quiz_preferences_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizPreferencesState(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    return MaterialApp(
      themeMode: prefs.themeMode,   // driven by Provider
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      // ... routes unchanged from Lab 10 Problem 3
      routes: {
        '/': (context) => const QuizCoverPage(),
        '/quiz': (context) => const MainNavigationQuizResult(),
        '/setting': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
