import 'package:flutter/material.dart';
import 'package:kasidech_navigation_exercises/screens/quiz_screen_home.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(),
        '/quiz': (context) => const QuizScreenHome(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
    ),
  );
}

class MainNavigationQuizCover extends StatelessWidget {
  const MainNavigationQuizCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class QuizCoverPage extends StatelessWidget {
  const QuizCoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.quiz_outlined, size: 120, color: Theme.of(context).colorScheme.primary,),
                  Text(
                    "Welcome to the Quiz App KM",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "By Kasidech Meelarp 663040641-0",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  child: const Text("Start"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
