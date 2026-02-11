import 'package:kasidech_interactivity_exercises/models/choice.dart';

class Question {
  final String title;
  final String imagePath;
  final List<Choice> choices;
  
  const Question({
    required this.title,
    required this.imagePath,
    required this.choices,
  });
}
