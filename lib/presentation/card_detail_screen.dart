import 'dart:io';

import 'package:cards_animation_3d/domain/cards.dart';
import 'package:flutter/material.dart';

import 'card_3d_widget.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({Key? key, required this.card}) : super(key: key);
  final Card3D card;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black45),
        leading: IconButton(
          color: Theme.of(context).iconTheme.color,
          icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                child: SizedBox(
                  height: 215.0,
                  child: Cards3DWidget(
                    card: card,
                    border: 4.0,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                card.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.black54,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 6.0),
              Text(
                card.author,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: Colors.grey,
                ),
                maxLines: 3,
              )
            ],
          ),
          // Column(
          //   children: [Placeholder()],
          // )
        ],
      ),
    );
  }
}
