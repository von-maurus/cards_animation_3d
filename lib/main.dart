import 'package:cards_animation_3d/presentation/cards_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CardsAnimation3D());
}

class CardsAnimation3D extends StatelessWidget {
  const CardsAnimation3D({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardsHome(title: '3D Cards Animation'),
    );
  }
}
