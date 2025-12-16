import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pet App')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PetCard(
                  imageUrl:
                      'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                  petName: 'Dog',
                  textColor: Colors.white,
                  fontSize: 20.0,
                  showBorder: false,
                ),
                PetCard(
                  imageUrl:
                      'https://marketplace.canva.com/8-1Kc/MAGoQJ8-1Kc/1/tl/canva-ginger-cat-with-paws-raised-in-air-MAGoQJ8-1Kc.jpg',
                  petName: 'Cat',
                  textColor: Colors.black,
                  fontSize: 20.0,
                  showBorder: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
