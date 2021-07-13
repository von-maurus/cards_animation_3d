class Card3D {
  Card3D({required this.title, required this.author, this.image = ''});
  final String title;
  final String author;
  final String image;

  static const path = 'assets/3D_cards_animation';
}

final cardList = [
  Card3D(
      title: 'Blue Neighbourhood',
      author: 'Troye Sivan',
      image: '${Card3D.path}/1.png'),
  Card3D(
      title: 'The Escape',
      author: 'Bundii Staxxx',
      image: '${Card3D.path}/2.png'),
  Card3D(
      title: 'Bohemian Rhapsody',
      author: 'Queen',
      image: '${Card3D.path}/3.png'),
  Card3D(title: 'Perfect', author: 'Ed Sheeran', image: '${Card3D.path}/4.png'),
  Card3D(title: 'Pain', author: 'Ryan Jones', image: '${Card3D.path}/5.png'),
  Card3D(title: 'Nevermind', author: 'Nirvana', image: '${Card3D.path}/6.jpg'),
  Card3D(
      title: 'Random Album Title',
      author: 'Deadmau5',
      image: '${Card3D.path}/7.jpg')
];
