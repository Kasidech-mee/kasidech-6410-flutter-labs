import 'package:flutter/material.dart';
import 'package:kasidech_interactivity_exercises/models/choice.dart';

class QuestionChoiceCard extends StatelessWidget {
  final Choice choice;
  final bool isSelected;
  final VoidCallback onTap;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isSelected
        ? Theme.of(context).colorScheme.primaryContainer
        : (choice.displayColor);

    final Color textColor =
        ThemeData.estimateBrightnessForColor(backgroundColor) ==
            Brightness.light
        ? Colors.black
        : Colors.white;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : (choice.displayColor),
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(choice.name, style: TextStyle(color: textColor)),
      ),
    );
  }
}
