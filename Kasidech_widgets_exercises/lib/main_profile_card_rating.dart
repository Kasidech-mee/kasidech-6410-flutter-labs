import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/profile_card_rating.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: const MainProfileCardRating(),
    ),
  );
}

class MainProfileCardRating extends StatelessWidget {
  const MainProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileCardRating());
  }
}
