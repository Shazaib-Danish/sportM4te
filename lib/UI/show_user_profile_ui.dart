import 'package:flutter/cupertino.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<ShowUserProfile>(
                    future: _eventsModel,
                    builder: (context, data) {
                      if (data.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) => Column(children: [
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
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  offset: const Offset(1, 1))
                                            ]),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                              data.data!.user.image),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.data!.user.username,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Row(children: [
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
                                              items: <String>[
                                                'Block',
                                                'Report'
                                              ].map<DropdownMenuItem<String>>(
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
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height: 100,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: data.data!.user.sports.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => (Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, left: 8, right: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                                border: Border.all(
                                                  color: Colors.green,
                                                  width: 4.0,
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    data
                                                        .data!
                                                        .user
                                                        .sports[index]
                                                        .sport
                                                        .image),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(data.data!.user
                                                .sports[index].sport.slug),
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Center(
                                              child: Text(
                                                  '${data.data!.friends.list.length}'))),
                                      Expanded(
                                          child: Center(
                                              child: Text(
                                                  '${data.data!.events.public.length + data.data!.events.private.length}'))),
                                      const Expanded(
                                          child: Center(child: Text("0"))),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child:
                                              Center(child: Text("Friends"))),
                                      Expanded(
                                          child: Center(child: Text("Events"))),
                                      Expanded(
                                          child: Center(
                                              child: Text("Joined Events"))),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  if (data.data!.events.private.isNotEmpty ||
                                      data.data!.events.public.isNotEmpty)
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        height: 150,
                                        child: MyWidget(
                                            eventsModel: _eventsModel)),
                                ]));
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}

enum _Tab { Private, Public }

class MyWidget extends StatefulWidget {
  const MyWidget({
    Key? key,
    required this.eventsModel,
  }) : super(key: key);
  final Future<ShowUserProfile> eventsModel;
  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  _Tab _selectedTab = _Tab.Public;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: CupertinoSegmentedControl<_Tab>(
            selectedColor: Colors.green,
            borderColor: Colors.grey,
            pressedColor: Colors.grey,
            children: {
              _Tab.Public: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.public),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Public',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              _Tab.Private: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Private',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            },
            onValueChanged: (value) {
              setState(() {
                _selectedTab = value;
              });
            },
            groupValue: _selectedTab,
          ),
        ),
        Expanded(
          child: FutureBuilder<ShowUserProfile>(
            future: widget.eventsModel,
            builder: (context, data) {
              if (data.hasData) {
                switch (_selectedTab) {
                  case _Tab.Public:
                    return ListViewOfEventsHosting(
                      data: data.data!.events.public,
                    );
                  case _Tab.Private:
                    return ListViewOfEventsHosting(
                      data: data.data!.events.private,
                    );

                  default:
                    return Container();
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}

class ListViewOfEventsHosting extends StatelessWidget {
  const ListViewOfEventsHosting({
    Key? key,
    required this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        data[index].owner.sports[index].sport.image,
                        fit: BoxFit.cover,
                        height: 70,
                        width: 80,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].owner.sports[index].sport.slug,
                          ),
                          Text(
                            data[index].event,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data[index].dates.oneline!,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              Text(
                                data[index].location.formatted!,
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              );
            },
          )
        : const Center(child: Text("You don't have any private events."));
  }
}
