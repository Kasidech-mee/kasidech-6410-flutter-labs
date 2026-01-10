import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color? fgColor;

  const QuestionChoice({
    super.key,
    required this.name, 
    required this.bgColor,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color finalFgColor =
        fgColor ??
        (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? Colors.white
            : Colors.black);

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 150,
      height: 60,
      decoration: BoxDecoration(color: bgColor),
      child: Center(
        child: Text(name, style: TextStyle(color: finalFgColor)),
      ),
    );
  }
}
