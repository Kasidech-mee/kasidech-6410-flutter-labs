import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/screens/news_feed_screen.dart';

void main() {
  runApp(
    MaterialApp(
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
      ),themeMode: ThemeMode.system,
      home: NewsFeedScreen(),
    ),
  );
}

class MainNewsFeedResponsive extends StatelessWidget {
  const MainNewsFeedResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}