import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/screens/pets_screen.dart';

void main() {
  runApp(MainPetGallery());
}

class MainPetGallery extends StatelessWidget {
  const MainPetGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepOrangeAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: PetsScreen(),
    );
  }
}
