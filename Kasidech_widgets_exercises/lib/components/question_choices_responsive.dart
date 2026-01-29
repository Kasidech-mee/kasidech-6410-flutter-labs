import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/question_choice.dart';
import 'package:kasidech_widgets_exercises/utils/responsive.dart';

class QuestionChoicesResponsive extends StatelessWidget {
  const QuestionChoicesResponsive({
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Image(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: choices.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: Responsive.isPortrait(context) ? 2.5 : 8,
            ),
            itemBuilder: (context, index) {
              return choices[index];
            },
          ),
        ),
      ],
    );
  }
}
