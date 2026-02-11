import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/models/choice.dart';

class QuestionChoiceCard extends StatefulWidget {
  final Choice choice;
  final bool isSelected;
  final bool canSelected;
  final VoidCallback onSelected;
  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.canSelected,
    required this.onSelected,
  });

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (widget.isSelected) {
      bgColor = widget.choice.isCorrect ? Colors.green : Colors.red;
    } else {
      bgColor = widget.choice.displayColor;
    }

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.choice.name,
          style: TextStyle(
            color:
                ThemeData.estimateBrightnessForColor(bgColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      onTap: () => {
        if (!widget.canSelected) {widget.onSelected()} else {null},
      },
    );
  }
}
