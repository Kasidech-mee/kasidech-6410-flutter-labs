import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kasidech_async_exercises/models/album.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      home: MainCallAlbumsApi(),
    ),
  );
}

class MainCallAlbumsApi extends StatefulWidget {
  const MainCallAlbumsApi({super.key});

  @override
  State<MainCallAlbumsApi> createState() => _MainCallAlbumsApiState();
}

class _MainCallAlbumsApiState extends State<MainCallAlbumsApi> {
  List<Album> _albumList = [];

  bool isLoading = true;

  String? errorMessage;

  Future<void> fetchAlbum() async {
    try {
      if (!mounted) return;
      final String baseUrl =
          "${dotenv.env['BASE_URL']}${dotenv.env['ALBUMS_PATH']}";
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json',
          'Accept-Language': 'en-US,en;q=0.9',
          'Connection': 'keep-alive',
        },
      );
      setState(() {
        final List<dynamic> data = json.decode(response.body);
        _albumList = data.map((item) => Album.fromJson(item)).toList();
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
      errorMessage = "Exception error: $e";
      isLoading = false; 
    });
    }
  }

  String title = "Fetch Album 6410";

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text(title))),
        body: SafeArea(child: Center(child: Text(errorMessage ?? ""))),
      );
    } else if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text(title))),
        body: SafeArea(child: const Center(child: CircularProgressIndicator())),
      );
    } else if (_albumList.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text(title))),
        body: SafeArea(child: Center(child: Text("No Album found"))),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text(title))),
        body: SafeArea(
          child: ListView.builder(
            itemCount: _albumList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(_albumList[index].id.toString()),
                title: Text(_albumList[index].title),
              );
            },
          ),
        ),
      );
    }
  }
}
