import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Movie Details')),
        body: ListView(
          children: [
            Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(movie.title, style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(movie.overview),
            ),
          ],
        ));
  }
}
