import 'package:flutter/material.dart';
import 'package:imdb_app/models/movie_model.dart';
import 'package:imdb_app/screens/detail_screen.dart';
import 'package:imdb_app/screens/home_screen.dart';
import 'package:imdb_app/screens/no_internet_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return onPage(HomeScreen());
      case '/no_internet':
        return onPage(NoInternetScreen());
      case '/detail':
        return onPage(DetailScreen(
          movie: settings.arguments as MovieModel,
        ));
      default:
        return onPage(Scaffold(
          body: Center(
            child: Text('No page found !'),
          ),
        ));
    }
  }

  static MaterialPageRoute onPage(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
