import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope( // * native code -> back
      canPop: false, // * back button X
      child: Scaffold(
        body: Center(
          child: Text('No internet connection !'),
        ),
      ),
    );
  }
}
