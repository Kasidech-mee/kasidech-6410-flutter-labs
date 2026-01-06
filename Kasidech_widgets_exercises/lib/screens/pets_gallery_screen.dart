import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/pet_card_with_model.dart';
import 'package:kasidech_widgets_exercises/models/pet_model.dart';

/*
* A screen that display multiple pet card using petcard with model
* by pressing different data in pet model make pet card can show different data
*        
* @author Kasidech Meelarp
* @Student ID 663040641-0
* @Version 1.0.0
* @date 2 Jan 2026
*/ 

class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pet App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Bird',
                    imageUrl:
                        'https://academy.allaboutbirds.org/wp-content/uploads/2015/07/Painted_Bunting_male_Birdhsare_Tim_Hopwood.jpg',
                  ),
                ),
              ),
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Dog',
                    imageUrl:
                        'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=1200:*',
                    backgroundColor: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Cat',
                    imageUrl:
                        'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    textColor: Colors.yellowAccent,
                  ),
                ),
              ),
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Rabbit',
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWVoJjCq0MskT7EFqJy-xDXzIQav3ubPtaKQ&s',
                    backgroundColor: Colors.green,
                    textColor: Colors.yellowAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
