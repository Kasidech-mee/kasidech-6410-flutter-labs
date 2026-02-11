import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/components/question_choice_card.dart';
import 'package:kasidech_interactivity_exercises/models/question.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final bool showNextButton;
  final ValueChanged<bool> onAnswer;
  final VoidCallback onNext;
  const QuizScreen({
    super.key,
    required this.question,
    required this.showNextButton,
    required this.onAnswer,
    required this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;
  bool selectionMade = false;

  void _handleChoiceSelected(int index) {
    if (selectionMade) return;

    setState(() {
      selectedIndex = index;
      selectionMade = true;
    });

    widget.onAnswer(widget.question.choices[index].isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.question.title, style: Theme.of(context).textTheme.headlineLarge,),
        Image.asset(widget.question.imagePath) ,
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: widget.question.choices.length,
            itemBuilder: (context, index) {
              return QuestionChoiceCard(
                choice: widget.question.choices[index],
                isSelected: selectedIndex == index,
                canSelected: selectionMade,
                onSelected: () => _handleChoiceSelected(index),
              );
            },
          ),
        ),
        if (selectionMade)
          ElevatedButton(onPressed: widget.onNext, child: const Text("Next")),
      ],
    );
  }
}
