import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:imdb_app/screens/home_screen.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int index = 0;
  final screens = [HomeScreen(), SizedBox(), SizedBox(), SizedBox()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: index,
        onTap: (v) {
          setState(() {
            index = v;
          });
        },
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home
          ),
          CrystalNavigationBarItem(
            icon: Icons.category_rounded
          ),
          CrystalNavigationBarItem(
            icon: Icons.repeat_outlined
          ),
          CrystalNavigationBarItem(
            icon: Icons.person
          ),
        ],
      ),
      body: IndexedStack(index: index, children: screens),
    );
  }
}
