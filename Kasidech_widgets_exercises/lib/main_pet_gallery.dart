import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/screens/pets_screen.dart';

/*
main file to run Pet Gallery app
by display pet screen in material app

@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 5 Jan 2026
*/

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
