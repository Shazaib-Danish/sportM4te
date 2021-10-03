import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/API%20Manager/user_show_profile_api_manager.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/show_user_profile.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';

class ShowUserProfileUI extends StatefulWidget {
  const ShowUserProfileUI({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  State<ShowUserProfileUI> createState() => _ShowUserProfileUIState();
}

class _ShowUserProfileUIState extends State<ShowUserProfileUI> {
  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();
  late Future<ShowUserProfile> _eventsModel;
  @override
  void initState() {
    _eventsModel = ShowProfileUserApiManager().getUserDetailsByName(
        widget.userName,
        Provider.of<DataManager>(context, listen: false).getUserToken,
        context);

    super.initState();
  }

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
        body: FutureBuilder<ShowUserProfile>(
            future: _eventsModel,
            builder: (context, data) {
              if (data.connectionState == ConnectionState.none &&
                  data.hasData == null) {
                return Container();
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) => Column(
                          children: [
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 20,
                                            blurRadius: 11,
                                            color: Colors.grey.withOpacity(0.2),
                                            offset: const Offset(1, 1))
                                      ]),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(data.data!.user.image),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.data!.user.username,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Row(children: [
                                      if (data.data!.friends.list[index])
                                        IconButton(
                                          splashColor: Colors.green,
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.person_add_alt_1,
                                            color: Colors.green,
                                          ),
                                        ),
                                      DropdownButton<String>(
                                        icon: const Icon(
                                          Icons.block,
                                          color: Colors.red,
                                        ),
                                        iconSize: 20,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onChanged: (String? newValue) {
                                          setState(() {});
                                        },
                                        items: <String>['Block', 'Report']
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        splashColor: Colors.green,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.message,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ]),
                                  ],
                                )
                              ],
                            ),
                            ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(data.data!
                                          .user.sports[index].sport.image),
                                    ),
                                    Text(data
                                        .data!.user.sports[index].sport.slug)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ));
              }
            }),
      ),
    );
  }
}
