import 'package:cards_animation_3d/domain/cards.dart';
import 'package:flutter/material.dart';

class Cards3DWidget extends StatelessWidget {
  const Cards3DWidget({Key? key, required this.card, required this.border})
      : super(key: key);
  final Card3D card;
  final double border;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(border),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border),
        child: Image.asset(
          card.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
