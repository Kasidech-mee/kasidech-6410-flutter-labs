import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/models/movie_model.dart';

// AI use: ask about how to use if else to append widget

/*
A main file to run movie list app to append movie info and rating with conditional styling

AI DOCUMENTATION
Ask AI about how to use if else to append widget
AI suggested using operator suchas (? : ) to apply different styles based on movie rating or useing normal if else

I'm using ? : operator for make code cleaner and easier to read
the way i write is before ? is condition to check after ? is what to do if condition is true and after the true condition after : is what todo if condition is false
the syntax is somethingl ike this (condition ? valueIfTrue : valueIfFalse) like movie.rating >= 8 ? "Highly rated movie!" : movie.rating >= 6
condition is movie.rating >= 8 if true show "Highly rated movie!" if false check next condition movie.rating >= 6 ?

In running function I use material app with light and dark theme support and home is MainMovies widget to append movie list

In tap handle use to handle what to do when tap on list tile show snack bar with different message based on movie rating using ? : operator again


@author Kasidech Meelarp
@Student ID 663040641-0
@Version 1.0.0
@date 5 Jan 2026
*/

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: const MainMovies(),
    ),
  );
}

class MainMovies extends StatelessWidget {
  const MainMovies({super.key});

  void _handleTap(BuildContext context, MovieModel movie) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          movie.rating >= 8
              ? "Highly rated movie!"
              : movie.rating >= 6
              ? "This is a good movie."
              : "This movie has a lower rating.",
        ),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = [
      const MovieModel(
        titles: "The Shawshank Redemption",
        releaseYear: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      const MovieModel(
        titles: "Inception",
        releaseYear: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      const MovieModel(
        titles: "Disaster Movie",
        releaseYear: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: movies.map((movie) {
          return ListTile(
            leading: Icon(
              Icons.movie,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              movie.titles,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${movie.releaseYear} - ${movie.genre}",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  "Director ${movie.director}",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: movie.rating >= 7
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                Text(
                  "${movie.rating}",
                  style: TextStyle(
                    color: movie.rating >= 7
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: movie.rating >= 7
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
            onTap: () => _handleTap(context, movie),
          );
        }).toList(),
      ), //
    );
  }
}
