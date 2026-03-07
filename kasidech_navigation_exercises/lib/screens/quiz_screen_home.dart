import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/models/choice.dart';
import 'package:kasidech_interactivity_exercises/models/question.dart';
import 'package:kasidech_navigation_exercises/screens/quiz_screen.dart';

class QuizScreenHome extends StatefulWidget {
  const QuizScreenHome({super.key});

  @override
  State<QuizScreenHome> createState() => _QuizScreenHomeState();
}

class _QuizScreenHomeState extends State<QuizScreenHome> {
  int currentQuestionIndex = 0;
  int score = 0;
  int resetCounter = 0;

  final Map<int, int?> _selectedAnswers = {};
  final Map<int, bool> _questionAnswered = {};

  final List<Question> _questions = [
    Question(
      title: "where is this place",
      imagePath: "assets/images/kkuPicture.webp",
      choices: [
        Choice(
          name: "KKU",
          isCorrect: true,
          displayColor: Colors.deepOrangeAccent,
        ),
        Choice(
          name: "เชียงใหม่",
          isCorrect: false,
          displayColor: Colors.purple,
        ),
        Choice(
          name: "เลย",
          isCorrect: false,
          displayColor: Colors.yellowAccent,
        ),
        Choice(name: "สกลนคร", isCorrect: false, displayColor: Colors.red),
      ],
    ),
    Question(
      title: "where is this place in kku",
      imagePath: "assets/images/kkuScience.jpg",
      choices: [
        Choice(name: "Science", isCorrect: true, displayColor: Colors.yellow),
        Choice(name: "Engineer", isCorrect: false, displayColor: Colors.orange),
        Choice(
          name: "Architecture",
          isCorrect: false,
          displayColor: Colors.green,
        ),
        Choice(name: "Art", isCorrect: false, displayColor: Colors.pinkAccent),
      ],
    ),
    Question(
      title: "Who is this guy",
      imagePath: "assets/images/randomChineseGuy.jpg",
      choices: [
        Choice(
          name: "Random guy",
          isCorrect: true,
          displayColor: Colors.yellow,
        ),
        Choice(
          name: "Not random guy",
          isCorrect: false,
          displayColor: Colors.red,
        ),
        Choice(
          name: "random woman",
          isCorrect: false,
          displayColor: Colors.pink,
        ),
        Choice(
          name: "Not random woman",
          isCorrect: false,
          displayColor: Colors.blue,
        ),
      ],
    ),
  ];

  void _handleChoiceSelection(int choiceIndex) {
    setState(() {
      int? previousChoiceIndex = _selectedAnswers[currentQuestionIndex];

      if (previousChoiceIndex != null &&
          _questions[currentQuestionIndex]
              .choices[previousChoiceIndex]
              .isCorrect) {
        score--;
      }

      _selectedAnswers[currentQuestionIndex] = choiceIndex;
      _questionAnswered[currentQuestionIndex] = true;

      if (_questions[currentQuestionIndex].choices[choiceIndex].isCorrect) {
        score++;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers.clear();
      _questionAnswered.clear();
      resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quiz App by 663040641-0")),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: QuizScreen(
                key: ValueKey(resetCounter),
                question: _questions[currentQuestionIndex],
                onChoiceSelected: _handleChoiceSelection,
                initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Visibility(
                        visible: currentQuestionIndex > 0 ? true : false,
                        child: ElevatedButton(
                          onPressed: () => setState(() {
                            currentQuestionIndex--;
                          }),
                          child: const Text("Previous"),
                        ),
                      ),
                      Visibility(
                        visible: currentQuestionIndex < 0 ? true : false,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text("Home"),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentQuestionIndex < _questions.length - 1) {
                        setState(() => currentQuestionIndex++);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Quiz Finished!"),
                            content: Text(
                              "Your score: $score / ${_questions.length}",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _restartQuiz();
                                },
                                child: const Text("Restart"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Next"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
