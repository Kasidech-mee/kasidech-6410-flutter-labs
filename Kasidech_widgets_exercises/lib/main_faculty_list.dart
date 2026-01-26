import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/models/faculty_model.dart';
import 'package:kasidech_widgets_exercises/screens/faculty_detail.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: MainFacultyList())],
          ),
        ),
      ),
    )
  );
}

class MainFacultyList extends StatefulWidget {
  const MainFacultyList({super.key});

  @override
  State<MainFacultyList> createState() => _MainFacultyListState();
}

class _MainFacultyListState extends State<MainFacultyList> {
  static List<String> facultyNames = [
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Science',
  ];
  static List<String> facultyThaiNames = [
    'คณะวิศวกรรมศาสตร์',
    'คณะแพทยศาสตร์',
    'คณะวิทยาศาสตร์',
  ];
  static List<String> facultyImageUrls = [
    'assets/images/ENKKU.jpg',
    'assets/images/MDKKU.webp',
    'assets/images/SCKKU.jpg',
  ];
  static List<String> facultyDescriptions = [
    'https://www.en.kku.ac.th/web/',
    'https://md.kku.ac.th/',
    'https://sc.kku.ac.th/',
  ];
  final List<FacultyModel> facultyData = List.generate(
    facultyNames.length,
    (index) => FacultyModel(
      name: facultyNames[index],
      thaiName: facultyThaiNames[index],
      imageUrl: facultyImageUrls[index],
      description: facultyDescriptions[index],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('KKU Faculty List 663040641-0'))),
      body: ListView.builder(
        itemCount: facultyNames.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.chevron_right),
              title: Text(facultyNames[index]),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        FacultyDetail(facultyModel: facultyData[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
