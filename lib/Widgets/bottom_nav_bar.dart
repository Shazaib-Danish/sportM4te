import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key,
      required this.scaffoldKey,
      required this.onTap,
      required this.index})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function(int)? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      height: 60.0,
      items: const [
        Icon(Icons.search, size: 30),
        Icon(Icons.event, size: 30),
        Icon(Icons.home, size: 30),
        Icon(CupertinoIcons.sportscourt, size: 30),
        Icon(Icons.menu, size: 30),
      ],
      color: Theme.of(context).primaryColor,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.green,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: onTap,
      letIndexChange: (index) => true,
    );
  }
}
