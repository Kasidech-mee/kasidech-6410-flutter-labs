import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/screens/question_with_choices.dart';
import 'package:kasidech_interactivity_exercises/components/question_choice.dart';

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
      ),
      themeMode: ThemeMode.system,
      home: MainQuizCheckAnswer(),
    ),
  );
}

class MainQuizCheckAnswer extends StatelessWidget {
  const MainQuizCheckAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Quiz App by 663040641-0"),),),
      body: SafeArea(
        child: QuestionWithChoices(
          title: "Where is this place?",
          imgPath: "assets/images/kku.webp",
          questionChoice: [
            QuestionChoice(
              name: 'KKU',
              bgColor: Theme.of(context).colorScheme.primary,
              correct: true,
            ),
            QuestionChoice(
              name: 'CMU',
              bgColor: Colors.purple,
              correct: false,
            ),
            QuestionChoice(
              name: 'CU',
              bgColor: Colors.pinkAccent,
              correct: false,
            ),
            QuestionChoice(
              name: 'MU',
              bgColor: Colors.blue,
              correct: false,
            ),
          ],
        ),
      ),
    );
  }
}
