import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/models/pet_model.dart';

/*
* A widget that displays a pet card
* use in pet screen for make append multiple pet cards easily
* by using pet model to make data format for pet card 
* and using supercard from petmodel to make it can check data format easily
*        
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 2 Jan 2026
* */


class PetCardWithModel extends StatelessWidget {
  const PetCardWithModel({super.key, required this.pet});

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
          child: Image.network(
            pet.imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0)),
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(color: pet.backgroundColor),
            child: Text(
              textAlign: TextAlign.center,
              pet.name,
              style: TextStyle(fontSize: 24, color: pet.textColor),
            ),
          ),
        ),
      ],
    );
  }
}
