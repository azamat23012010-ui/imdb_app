import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:imdb_app/router/app_router.dart';
import 'package:imdb_app/screens/main.dart';

// * Global context -> home / detail ozi context aniqlab olib beradi
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((status) {
      if (status.contains(ConnectivityResult.none)) {
        Navigator.pushNamed(navigatorKey.currentContext!, '/no_internet');
      } else {
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/home',
      theme: ThemeData.dark(),
    );
  }
}
