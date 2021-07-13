import 'package:cards_animation_3d/domain/cards.dart';
import 'package:flutter/material.dart';

import 'card_3d_widget.dart';

class CardsHorizontal extends StatelessWidget {
  const CardsHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Recientemente Reproducidas',
            style:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cardList.length,
            itemBuilder: (context, index) {
              final card = cardList[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Cards3DWidget(
                  card: card,
                  border: 20.0,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
