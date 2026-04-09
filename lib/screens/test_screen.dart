import 'package:flutter/material.dart';
import 'package:imdb_app/widgets/home_layout_screen_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSkeleton(),
    );
  }
}