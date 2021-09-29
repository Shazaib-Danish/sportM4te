import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportm4te/UI/my_events_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _selectedIndex,
      height: 60.0,
      items: const [
        Icon(Icons.search, size: 30),
        Icon(Icons.event, size: 30),
        Icon(Icons.home, size: 30),
        Icon(CupertinoIcons.sportscourt, size: 30),
        Icon(Icons.menu, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.green,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 4) {
            widget.scaffoldKey.currentState!.openDrawer();
          } else if (_selectedIndex == 1) {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => const MyEvents()));
          }
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
