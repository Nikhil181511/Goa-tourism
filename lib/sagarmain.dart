import 'package:flutter/material.dart';
import 'package:tourism/sagar.dart';

void main() {
  runApp(const sag());
}

class sag extends StatelessWidget {
  const sag({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DudPage(),
    );
  }
}