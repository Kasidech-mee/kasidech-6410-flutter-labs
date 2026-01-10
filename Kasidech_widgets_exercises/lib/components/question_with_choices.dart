import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/question_choice.dart';

class QuestionWithChoices extends StatelessWidget {
  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
  });

  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Image(image: AssetImage(imagePath), fit: BoxFit.cover)),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                choices[0],
                choices[1],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                choices[2],
                choices[3],
              ],
            ),
          ],
        )),
      ],
    );
  }
}
