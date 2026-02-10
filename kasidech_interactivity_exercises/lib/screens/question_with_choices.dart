import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/components/question_choice.dart';

//I can't reuse QuetionChioce because i use list that use model before and it doesn't have correct for that so i use same code from QuestionChoice just get the parameter that have correct

class QuestionWithChoices extends StatelessWidget {
  final String title;
  final String imgPath;
  final List<QuestionChoice> questionChoice;
  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.imgPath,
    required this.questionChoice,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        Expanded(child: Image.asset(imgPath)),
        Expanded(
          child: GridView.builder(
            itemCount: questionChoice.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: orientation == Orientation.portrait ? 2 : 7
            ),
            itemBuilder: (context, index) {
              return QuestionChoice(
                name: questionChoice[index].name,
                bgColor: questionChoice[index].bgColor,
                fgColor: questionChoice[index].fgColor,
                correct: questionChoice[index].correct,
              );
            },
          ),
        ),
      ],
    );
  }
}
