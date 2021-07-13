import 'package:cards_animation_3d/domain/cards.dart';
import 'package:flutter/material.dart';

import 'card_3d_widget.dart';

class Card3DItem extends AnimatedWidget {
  const Card3DItem({
    Key? key,
    required this.card,
    required this.percent,
    required this.height,
    required this.depth,
    required this.onCardSelected,
    this.verticalFactor = 0,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  final Card3D card;
  final double percent;
  final double height;
  final int depth;
  final ValueChanged<Card3D> onCardSelected;
  final int verticalFactor;
  // ignore: recursive_getters
  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    const depthFactor = 55.0;
    final bottomMargin = height / 6;
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      right: 0,
      top: height + -depth * (height / 2) * percent - bottomMargin,
      child: Opacity(
        opacity: verticalFactor == 0 ? 1 : 1 - animation.value,
        child: Hero(
          tag: card.title,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                0.0,
                (-verticalFactor * animation.value * size.height),
                depth * depthFactor,
              ),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => onCardSelected(card),
              child: SizedBox(
                height: height,
                child: Cards3DWidget(
                  card: card,
                  border: 4.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
