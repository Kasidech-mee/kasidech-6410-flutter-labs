import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/screens/pets_gallery_screen.dart';

/*
* main function to run pet model gallery app
* by display pet gallery screen in material app
*           
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 2 Jan 2026
*/ 

void main() {
  runApp(MainPetModelGallery());
}

class MainPetModelGallery extends StatelessWidget {
  const MainPetModelGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const PetsGalleryScreen(),
    );
  }
}
