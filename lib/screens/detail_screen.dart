import 'package:flutter/material.dart';
import 'package:imdb_app/models/movie_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            movie.primaryImage,
            height: 241,
            width: 200,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
