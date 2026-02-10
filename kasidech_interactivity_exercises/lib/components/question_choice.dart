import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/question_choice.dart'
    as cat;

//Gemini help fixing name collusion by using "as" statement to make implement old widget
//In this I use cat because it make sure that no another flutter use this word to be statement

class QuestionChoice extends StatefulWidget {
  final String name;
  final Color bgColor;
  final Color? fgColor;
  final bool correct;
  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
    required this.correct,
  });

  @override
  State<QuestionChoice> createState() => _QuestionChoiceState();
}

class _QuestionChoiceState extends State<QuestionChoice> {
  late Color displayColor = widget.bgColor;
  bool isAnswered = false; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: cat.QuestionChoice(
        name: widget.name,
        bgColor: displayColor,
        fgColor: widget.fgColor,
      ),
      onTap: () {
        if (isAnswered) return; // if Answered do nothings

        setState(() {
          displayColor = widget.correct ? Colors.green : Colors.red;
          isAnswered = true;
        });

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(widget.correct ? "Correct!" : "Incorrect"),
              content: Text(widget.correct 
                  ? "Your Score is 1" 
                  : "Your Score is 0"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context), 
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
