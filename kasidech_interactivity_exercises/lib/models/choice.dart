import 'package:flutter/material.dart';

class Choice {
  final String name;
  final bool isCorrect;
  final Color displayColor;
  
  const Choice({
    required this.name,
    required this.isCorrect,
    required this.displayColor,
  });
}
