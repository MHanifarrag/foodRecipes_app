import 'package:flutter/material.dart';
import 'package:nutrition_app/screens/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomeScreen(),
theme: ThemeData(
    fontFamily: 'Ubuntu',
),
  ));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}


