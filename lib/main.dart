import 'package:coronatracker/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19 Tracker',
      theme: ThemeData(
        primaryColor: Color(0xFF3D72DE),
        scaffoldBackgroundColor: Color(0xFF3D72DE),
      ),
      home: LoadingScreen(),
    );
  }
}
