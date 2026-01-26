import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/models/faculty_model.dart';

class FacultyDetail extends StatelessWidget {
  final FacultyModel facultyModel;
  const FacultyDetail({super.key, required this.facultyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("${facultyModel.name}"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text(facultyModel.description , style: Theme.of(context).textTheme.titleMedium,),
                ),
                SizedBox(height: 32),
                Text(facultyModel.thaiName , style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(facultyModel.imageUrl, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
