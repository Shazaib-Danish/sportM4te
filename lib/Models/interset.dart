class Interset {
  String icon;
  String title;
  bool isSelect;

  Interset({
    required this.title,
    required this.icon,
    required this.isSelect,
  });
}

String airsoft = '🔫';
String baseball = '⚾';
String basketball = '🏀';
String cricket = '🏏';
String field = '🏑';
String football = '⚽';
String golf = '⛳';
String ice = '🏒';
String league = '🏉';
String union = '🏉';
String soccer = '⚽';
String tennis = '🎾';
String volleyBall = '🏐';
String run = '🏃';
String fav = '❤️';

List<Interset> interset = [
  Interset(title: "Airsoft", icon: airsoft, isSelect: false),
  Interset(title: "Baseball", icon: baseball, isSelect: false),
  Interset(title: "Basketball", icon: basketball, isSelect: false),
  Interset(title: "Cricket", icon: cricket, isSelect: false),
  Interset(title: "Field Hockey", icon: field, isSelect: false),
  Interset(title: "Football", icon: football, isSelect: false),
  Interset(title: "Golf", icon: golf, isSelect: false),
  Interset(title: "Ice Hockey", icon: ice, isSelect: false),
  Interset(title: "Rugby League", icon: league, isSelect: false),
  Interset(title: "Rugby Union", icon: union, isSelect: false),
  Interset(title: "Soccer", icon: soccer, isSelect: false),
  Interset(title: "Tennis", icon: tennis, isSelect: false),
  Interset(title: "Volleyball", icon: volleyBall, isSelect: false),
  Interset(title: "Run", icon: run, isSelect: false),
];
