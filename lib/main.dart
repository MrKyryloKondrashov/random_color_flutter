import 'package:flutter/material.dart';
import 'package:random_color_app/screens/home_screen.dart';

void main() {
  runApp(const Main());
}
///Main App
class Main extends StatelessWidget {
  ///Default const constructor
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen() ,
    );
  }
}
