import 'package:flutter/material.dart';
import 'package:tourism/beach.dart';

void main() {
  runApp(const beach());
}

class beach extends StatelessWidget {
  const beach({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaloPage(),
    );
  }
}