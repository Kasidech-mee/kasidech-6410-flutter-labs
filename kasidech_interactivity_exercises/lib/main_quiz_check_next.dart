import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/models/choice.dart';
import 'package:kasidech_interactivity_exercises/models/question.dart';
import 'package:kasidech_interactivity_exercises/screens/quiz_screen.dart';

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
      home: MainQuizCheckNext(),
    ),
  );
}

class MainQuizCheckNext extends StatefulWidget {
  const MainQuizCheckNext({super.key});

  @override
  State<MainQuizCheckNext> createState() => _MainQuizCheckNextState();
}

class _MainQuizCheckNextState extends State<MainQuizCheckNext> {
  int currentQuestionIndex = 0;
  int score = 0;
  int _resetCounter = 0;
  bool questionAnswered = false;

  final List<Question> questions = [
    const Question(
      title: "Where is this place?",
      imagePath: "assets/images/kku.webp",
      choices: [
        Choice(name: "Chaing Mai", isCorrect: false, displayColor: Colors.amber),
        Choice(name: "Phuket", isCorrect: false, displayColor: Colors.blue),
        Choice(name: "Khon Kaen", isCorrect: true, displayColor: Colors.orange),
        Choice(name: "Bangkok", isCorrect: false, displayColor: Colors.purple),
      ],
    ),
  ];

  void _handleAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) score++;
      questionAnswered = true;
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Complete!"),
        content: Text("Your score: $score / 1"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                score = 0;
                questionAnswered = false;
                _resetCounter++;
              });
            },
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Quiz App by 663040641-0"),)),
      body: SafeArea(
        child: QuizScreen(
          key: ValueKey('${currentQuestionIndex}_$_resetCounter'),
          question: questions[currentQuestionIndex],
          onAnswer: _handleAnswer,
          onNext: _showResultDialog,
          showNextButton: questionAnswered,
        ),
      ),
    );
  }
}
