import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  const ContactImage({super.key, required this.imageFile, required this.name});

  final String imageFile;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imageFile),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ),

      ],
    );
  }
}