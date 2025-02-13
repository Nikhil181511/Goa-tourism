import 'package:flutter/material.dart';
import 'package:tourism/hotel.dart';

void main() {
  runApp(const hot());
}

class hot extends StatelessWidget {
  const hot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FishPage(),
    );
  }
}