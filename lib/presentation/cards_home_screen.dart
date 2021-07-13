import 'package:cards_animation_3d/domain/cards.dart';
import 'package:cards_animation_3d/presentation/card_3d_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_detail_screen.dart';
import 'cards_horizontal.dart';

class CardsHome extends StatelessWidget {
  const CardsHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.alignLeft),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Column(
        children: [
          const Expanded(flex: 2, child: CardsBody()),
          Expanded(
            flex: 1,
            child: CardsHorizontal(
              key: key,
            ),
          )
        ],
      ),
    );
  }
}

class CardsBody extends StatefulWidget {
  const CardsBody({Key? key}) : super(key: key);

  @override
  _CardsBodyState createState() => _CardsBodyState();
}

class _CardsBodyState extends State<CardsBody> with TickerProviderStateMixin {
  //Dar tap a la Card

  bool _selectedMode = false;
  AnimationController? _animationControllerSelection;
  AnimationController? _animationControllerMovement;
  int? _selectedIndex;

  @override
  void initState() {
    _animationControllerSelection = AnimationController(
      vsync: this,
      lowerBound: 0.15,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 900),
    );
    _animationControllerMovement = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationControllerSelection!.dispose();
    _animationControllerMovement!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
            animation: _animationControllerSelection!,
            builder: (context, snapshot) {
              final selectionValue = _animationControllerSelection!.value;
              return GestureDetector(
                onTap: () {
                  if (!_selectedMode) {
                    _animationControllerSelection!.forward().whenComplete(() {
                      setState(() {
                        _selectedMode = true;
                      });
                    });
                  } else {
                    _animationControllerSelection!.reverse().whenComplete(() {
                      setState(() {
                        _selectedMode = false;
                      });
                    });
                  }
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0011)
                    ..rotateX(selectionValue),
                  alignment: Alignment.center,
                  child: AbsorbPointer(
                    absorbing: !_selectedMode,
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth * 0.62,
                      color: Colors.transparent,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: List.generate(
                          7,
                          (index) => Card3DItem(
                            animation: _animationControllerMovement!.view,
                            height: constraints.maxHeight / 2,
                            card: cardList[index],
                            percent: selectionValue,
                            depth: index,
                            verticalFactor: _getCurrentFactor(index),
                            onCardSelected: (card) {
                              _onCardSelected(card, index);
                            },
                          ),
                        ).reversed.toList(),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  Future<void> _onCardSelected(Card3D card, int index) async {
    setState(() {
      _selectedIndex = index;
    });
    const duration = Duration(milliseconds: 450);
    _animationControllerMovement!.forward();
    // print('Listen to ${card.title} by ${card.author}');
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, _) => FadeTransition(
          opacity: animation,
          child: CardDetail(
            card: card,
          ),
        ),
      ),
    );
    _animationControllerMovement!.reverse(from: 1.0);
  }

  int _getCurrentFactor(int currentIndex) {
    if (_selectedIndex == null || currentIndex == _selectedIndex) {
      return 0;
    } else if (currentIndex > _selectedIndex!) {
      return -1;
    } else {
      //Para que los de arriba se vayan hacia arriba y los de abajo hacia abajo se retorna 1,
      //Modificacion: Dejar que todos vayan hacia abajo (simular sacar un vinilo)
      //return 1
      return -1;
    }
  }
}
