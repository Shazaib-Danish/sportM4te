import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/UI/profile_screen.dart';
import 'package:sportm4te/Widgets/drawer_resuable_child.dart';

class Draawer extends StatelessWidget {
  const Draawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/sportm4te_logo.png',
              color: Colors.black,
              scale: MediaQuery.of(context).size.aspectRatio * 15.0,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const DrawerReusableChild(
              title: 'Dashboard',
              iconData: Icons.home_rounded,
              color: Color(0xFF5695E6),
            ),
            const DrawerReusableChild(
              title: 'Inbox',
              iconData: CupertinoIcons.chat_bubble_fill,
              color: Color(0xFFDE78B4),
            ),
            DrawerReusableChild(
              title: 'My Profile',
              iconData: CupertinoIcons.person_fill,
              color: const Color(0xFFF4654A),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProfileScreen()));
              },
            ),
            const DrawerReusableChild(
              title: 'Search Users',
              iconData: CupertinoIcons.group_solid,
              color: Color(0xFFA68BE7),
            ),
            const DrawerReusableChild(
              title: 'Settings',
              iconData: Icons.settings,
              color: Color(0xFFFCC74E),
            ),
            const DrawerReusableChild(
              title: 'Sport Preferences',
              iconData: CupertinoIcons.list_number,
              color: Color(0xFF43C9A7),
            ),
            const DrawerReusableChild(
              title: 'Create Event',
              iconData: Icons.add,
              color: Color(0xFFB39A7A),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFF5C636E),
                        ),
                        child: const Icon(
                          Icons.nightlight_round,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text(
                        'Dark Mode',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: Provider.of<DataManager>(context).isLightMode,
                        onChanged: (value) {
                          Provider.of<DataManager>(context, listen: false)
                              .darkMode(value);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            const DrawerReusableChild(
              title: 'Sign Out',
              iconData: Icons.logout,
              color: Color(0xFFE54E5D),
            ),
            const DrawerReusableChild(
              title: 'About',
              iconData: CupertinoIcons.info_circle_fill,
              color: Color(0xFF9ACE61),
            ),
          ],
        ),
      ),
    );
  }
}
