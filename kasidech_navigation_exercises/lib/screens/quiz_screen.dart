import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/models/question.dart';
import 'package:kasidech_navigation_exercises/components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final int? initialSelectedIndex;
  final int? isInitiallyAnswered;
  final Function(int) onChoiceSelected;

  const QuizScreen({
    super.key,
    required this.question,
    this.initialSelectedIndex,
    this.isInitiallyAnswered,
    required this.onChoiceSelected,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
    widget.isInitiallyAnswered;
  }

  @override
  void didUpdateWidget(covariant QuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update state when navigating to a different question
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Image.asset(widget.question.imagePath, height: 200, fit: BoxFit.cover),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: widget.question.choices.length,
            itemBuilder: (context, index) {
              return QuestionChoiceCard(
                choice: widget.question.choices[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() => selectedIndex = index);
                  widget.onChoiceSelected(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
