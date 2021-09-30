import 'package:flutter/material.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyProfile,
      drawer: const Drawer(
        child: Draawer(),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SilverAppbar(
                appBarKey: keyProfile,
                title: 'Profile',
              ),
            ];
          },
          body: Column(
            children: [],
          )),
    );
  }
}
