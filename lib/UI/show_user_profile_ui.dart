import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportm4te/API%20Manager/api_block.dart';
import 'package:sportm4te/API%20Manager/api_send_frnd_reqst.dart';
import 'package:sportm4te/API%20Manager/user_show_profile_api_manager.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';

import 'package:sportm4te/Models/show_user_profile.dart';
import 'package:sportm4te/UI/dashboard.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ShowUserProfileUI extends StatefulWidget {
  const ShowUserProfileUI({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  State<ShowUserProfileUI> createState() => _ShowUserProfileUIState();
}

class _ShowUserProfileUIState extends State<ShowUserProfileUI> {
  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();
  late Future<ShowUserProfile> _eventsModel;
  final List<bool> selectedStar = [true, true, true, true, true];
  TextEditingController _review = TextEditingController();
  late SharedPreferences loginPreferences;
  String? userName;
  String? userImage;
  int? userId;

  var month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  intializeShared() async {
    loginPreferences = await SharedPreferences.getInstance();
    userName = loginPreferences.getString('userName');
    userImage = loginPreferences.getString('userImage');
    userId = loginPreferences.getInt('userID');
  }

  @override
  void initState() {
    intializeShared();

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
                isEventDetail: false,
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  FutureBuilder<ShowUserProfile>(
                      future: _eventsModel,
                      builder: (context, data) {
                        if (data.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  Column(children: [
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.data!.user.username,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            if (userName!.toLowerCase() !=
                                                widget.userName.toLowerCase())
                                              Column(children: [
                                                IconButton(
                                                  splashColor: Colors.green,
                                                  onPressed: () async {
                                                    SendFriendRequestAPIManager()
                                                        .sentFriendRequest(
                                                            Provider.of<DataManager>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .userToken,
                                                            userId!,
                                                            context)
                                                        .whenComplete(() {
                                                      final request = Provider
                                                              .of<DataManager>(
                                                                  context,
                                                                  listen: false)
                                                          .friendRequest;
                                                      if (request.message ==
                                                          'Friend request has been sent!') {
                                                        showTopSnackBar(
                                                            context,
                                                            const CustomSnackBar
                                                                .success(
                                                              message:
                                                                  "Friend request has been sent!",
                                                            ));
                                                      } else {
                                                        showTopSnackBar(
                                                            context,
                                                            const CustomSnackBar
                                                                .error(
                                                              message:
                                                                  "Failed to send request",
                                                            ));
                                                      }
                                                    });
                                                  },
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
                                                  onChanged:
                                                      (String? newValue) async {
                                                    if (newValue == 'Block') {
                                                      BlockAPIManager()
                                                          .blockFriend(
                                                              Provider.of<DataManager>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .userToken,
                                                              data.data!.user
                                                                  .username,
                                                              context)
                                                          .whenComplete(() {
                                                        final request = Provider
                                                                .of<DataManager>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                            .blockFriend;
                                                        if (request.message ==
                                                            'User has been blocked') {
                                                          showTopSnackBar(
                                                              context,
                                                              const CustomSnackBar
                                                                  .success(
                                                                message:
                                                                    "User has been blocked",
                                                              ));
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Dashboard()));
                                                        } else {
                                                          showTopSnackBar(
                                                              context,
                                                              const CustomSnackBar
                                                                  .error(
                                                                message:
                                                                    "Failed to block",
                                                              ));
                                                        }
                                                      });
                                                    } else {
                                                      setState(() {});
                                                    }
                                                  },
                                                  items: <String>[
                                                    'Block',
                                                    'Report'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
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
                                            if (userName!.toLowerCase() ==
                                                widget.userName.toLowerCase())
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.green,
                                                            width: 2)),
                                                    child: MaterialButton(
                                                        onPressed: () {},
                                                        child: Row(
                                                          children: const [
                                                            Icon(Icons.settings,
                                                                color: Colors
                                                                    .green),
                                                            Text(
                                                              "Update Account",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      height: 100,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            data.data!.user.sports.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            (Column(
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                            child:
                                                Center(child: Text("Events"))),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          height: 150,
                                          child: MyWidget(
                                              eventsModel: _eventsModel)),
                                    if (userName!.toLowerCase() !=
                                        widget.userName.toLowerCase())
                                      Container(
                                        height: 350,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  offset: const Offset(0, 0.5))
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "My Review",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
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
                                                        offset:
                                                            const Offset(1, 1))
                                                  ]),
                                              child: CircleAvatar(
                                                radius: 50,
                                                backgroundImage:
                                                    NetworkImage(userImage!),
                                              ),
                                            ),
                                            Text(
                                              userName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 120,
                                              height: 20,
                                              child: ListView.builder(
                                                  itemCount: 5,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (context,
                                                          index) =>
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (selectedStar[
                                                                index]) {
                                                              selectedStar[
                                                                      index] =
                                                                  false;
                                                            } else {
                                                              selectedStar[
                                                                  index] = true;
                                                            }
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.star,
                                                          color: selectedStar[
                                                                      index] ==
                                                                  true
                                                              ? Colors.yellow
                                                                  .shade700
                                                              : Colors.brown
                                                                  .shade700,
                                                        ),
                                                      )),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              height: 50,
                                              child: TextField(
                                                controller: _review,
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      'Write Review...(Optional)',
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: MaterialButton(
                                                onPressed: () {},
                                                color: Colors.green,
                                                child:
                                                    const Text("Save Review"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            data.data!.reviews.received.length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          height: 150,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.all(20),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    offset:
                                                        const Offset(0, 0.5))
                                              ]),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width: 150,
                                                    child: ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: data
                                                            .data!
                                                            .reviews
                                                            .received[index]
                                                            .stars,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .yellow
                                                                      .shade700,
                                                                )),
                                                  ),
                                                  CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(data
                                                            .data!
                                                            .reviews
                                                            .received[index]
                                                            .author
                                                            .image),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        data
                                                            .data!
                                                            .reviews
                                                            .received[index]
                                                            .author
                                                            .username,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                      ),
                                                      Text(
                                                        data
                                                                .data!
                                                                .reviews
                                                                .received[index]
                                                                .createdAt
                                                                .day
                                                                .toString() +
                                                            'th ' +
                                                            month[data
                                                                    .data!
                                                                    .reviews
                                                                    .received[
                                                                        index]
                                                                    .createdAt
                                                                    .month -
                                                                1] +
                                                            ', ' +
                                                            data
                                                                .data!
                                                                .reviews
                                                                .received[index]
                                                                .createdAt
                                                                .year
                                                                .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                data.data!.reviews
                                                    .received[index].review,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]));
                        } else {
                          return Column(
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }
                      }),
                ],
              ),
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
