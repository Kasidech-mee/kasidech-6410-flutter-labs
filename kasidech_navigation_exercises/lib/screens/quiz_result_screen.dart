import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/models/question.dart';

class QuizResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, int?> selectedAnswers;
  final int score;
  final VoidCallback onRestart;
  const QuizResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Score:",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    "$score / ${questions.length}",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                //Ai Recommend to use variable for cleaner code
                final question = questions[index];
                final userChoiceIndex = selectedAnswers[index];
                final correctChoice = question.choices.firstWhere(
                  (c) => c.isCorrect,
                );
                //Ai suggest to use variable and if-else for more easier to read
                String feedbackText;
                Color feedbackColor;

                if (userChoiceIndex == null) {
                  feedbackText =
                      "Not answered - Correct: ${correctChoice.name}";
                  feedbackColor = Colors.orange;
                } else {
                  final userChoice = question.choices[userChoiceIndex];
                  if (userChoice.isCorrect) {
                    feedbackText = "${userChoice.name} ✅";
                    feedbackColor = Colors.green;
                  } else {
                    feedbackText =
                        "${userChoice.name} ❌ Should be ${correctChoice.name}";
                    feedbackColor = Colors.red;
                  }
                }

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: userChoiceIndex != null
                        ? correctChoice.displayColor
                        : Theme.of(context).colorScheme.primaryContainer,
                    child: Text("${index + 1}"),
                  ),
                  title: Text(
                    questions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    feedbackText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: feedbackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                onRestart();
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                "Restart Quiz",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
