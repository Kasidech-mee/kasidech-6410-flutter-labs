import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

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
                child: PetCard(
                  imageUrl:
                      'https://academy.allaboutbirds.org/wp-content/uploads/2015/07/Painted_Bunting_male_Birdhsare_Tim_Hopwood.jpg',
                  petName: 'Bird',
                ),
              ),
              Expanded(
                child: PetCard(
                  imageUrl:
                      'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=1200:*',
                  petName: 'Dog',
                ),
              ),  
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PetCard(
                  imageUrl:
                      'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  petName: 'Cat',
                ),
              ),
              Expanded(
                child: PetCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWVoJjCq0MskT7EFqJy-xDXzIQav3ubPtaKQ&s',
                  petName: 'Rabbit',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
