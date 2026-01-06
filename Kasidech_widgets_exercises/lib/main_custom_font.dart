import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/custom_font.dart';

/*
main file to run custom font widget app that use Material app and have custom font in center of screen

@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 5 Jan 2026
*/
void main() {
  runApp(const MainCustomFont());
}

class MainCustomFont extends StatelessWidget {
  const MainCustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepOrangeAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: CustomFont())],
          ),
        ),
      ),
    );
  }
}
