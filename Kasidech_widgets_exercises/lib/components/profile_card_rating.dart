import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/contact_image.dart';
import 'package:kasidech_widgets_exercises/components/contact_info.dart';
import 'package:kasidech_widgets_exercises/components/ratings.dart';

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactImage(imageFile: "assets/images/peXi.jpg", name: "Lichengkou"),
          ContactInfo(addrName: "Lichengkou's Place", addrInfo: "123 Chingchong China", email: "lichengkou@example.com", phone: "+1234567890"),
          Ratings(defaultColor: Colors.yellow, ratingColor: Colors.black),
        ],
      ),
    );
  }
}