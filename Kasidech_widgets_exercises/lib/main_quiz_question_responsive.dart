import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/question_choices_responsive.dart';
import 'package:kasidech_widgets_exercises/components/question_choice.dart';

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
      home: MainQuizQuestionResponsive(),
    ),
  );
}

class MainQuizQuestionResponsive extends StatelessWidget {
  const MainQuizQuestionResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 663040641-0'),
      ),
      body: SafeArea(child: QuestionChoicesResponsive(title: "Where is this this place?", imagePath: "assets/images/kku.jpg", choices: [
        QuestionChoice(name: "Choice A", bgColor: Colors.purpleAccent),
        QuestionChoice(name: "Choice B", bgColor: Colors.orangeAccent),
        QuestionChoice(name: "Choice C", bgColor: Colors.pinkAccent),
        QuestionChoice(name: "Choice D", bgColor: Colors.blueAccent),
      ]))
    );
  }
} 