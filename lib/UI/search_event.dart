import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/API%20Manager/api_search_events.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/interset.dart';
import 'package:sportm4te/Models/search_events.dart';

import 'package:sportm4te/Widgets/draawer.dart';

import 'package:sportm4te/Widgets/silver_app_bar.dart';

class SearchEvent extends StatefulWidget {
  const SearchEvent({Key? key}) : super(key: key);

  @override
  _SearchEventState createState() => _SearchEventState();
}

class _SearchEventState extends State<SearchEvent> {
  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final TextEditingController _searchTextController = TextEditingController();
  final TextEditingController _searchLocationController =
      TextEditingController();
  late Future<SearchEvents> _eventsModel;
  bool value = false;
  final List<bool> _expanded = [false, false, false];
  final List<bool> _eventDate = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  Future<void> searchEvents() async {
    setState(() {
      _eventsModel = EventSearchAPIManager().searchEventsByName(
          Provider.of<DataManager>(context, listen: false).getUserToken,
          _searchTextController.text.toString(),
          context);
    });
  }

  Future<SearchEvents> refreshSearchresults() async {
    setState(() {
      _searchTextController.text = '';
      _eventsModel = EventSearchAPIManager().searchEvents(
          Provider.of<DataManager>(context, listen: false).getUserToken,
          context);
    });
    return _eventsModel;
  }

  @override
  void initState() {
    _eventsModel = EventSearchAPIManager().searchEvents(
        Provider.of<DataManager>(context, listen: false).getUserToken, context);

    super.initState();
  }

  @override
  void dispose() {
    _searchLocationController.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        key: keyProfile,
        drawer: const Drawer(
          child: Draawer(),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SilverAppbar(
                appBarKey: keyProfile,
                title: 'Search Event',
                isEventDetail: false,
              ),
            ];
          },
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: refreshSearchresults,
            child: SingleChildScrollView(
              child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: Column(
=======
      key: keyProfile,
      drawer: const Drawer(
        child: Draawer(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SilverAppbar(
              appBarKey: keyProfile,
              title: 'Search',
              isEventDetail: false,
            ),
          ];
        },
        body: SingleChildScrollView(
            child: FutureBuilder<SearchEvents>(
                future: _eventsModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
<<<<<<< HEAD
                              color: Colors.white,
=======
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(0, 0.5))
                              ]),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.search,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
<<<<<<< HEAD
                                width: MediaQuery.of(context).size.width / 1.5,
=======
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                child: TextField(
                                  autofillHints: const [
                                    AutofillHints.addressCityAndState
                                  ],
<<<<<<< HEAD
                                  onEditingComplete: searchEvents,
=======
                                  onSubmitted: (value) =>
                                      _searchTextController,
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                  controller: _searchTextController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Searching for something..."),
<<<<<<< HEAD
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(0, 0.5))
                              ]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Filters",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
=======
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: const Offset(0, 0.5))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Filters",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width /
                                              1.3,
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                      margin: const EdgeInsets.only(
                                          left: 20, bottom: 10),
                                      child: ExpansionPanelList(
                                        dividerColor: Colors.grey,
                                        expansionCallback: (index, expanded) {
                                          setState(() {
                                            _expanded[index] = !expanded;
                                          });
                                        },
                                        children: [
                                          ExpansionPanel(
                                              headerBuilder:
                                                  (BuildContext context,
                                                      bool isActive) {
                                                return const ListTile(
                                                  leading: Icon(
                                                    Icons.list,
                                                    color: Colors.red,
                                                  ),
                                                  title: Text("Sports"),
                                                );
                                              },
                                              body: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.3,
                                                    height: 50,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            bottom: 20),
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          interset.length,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            changeIndexCheckAll(
                                                                index);
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          decoration: BoxDecoration(
                                                              color: interset[index]
                                                                          .isSelect ==
                                                                      false
                                                                  ? Colors.white
                                                                  : Colors.green,
                                                              borderRadius: const BorderRadius.all(Radius.circular(25)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.1),
                                                                    offset:
                                                                        const Offset(
                                                                            1,
                                                                            4))
                                                              ]),
                                                          child: interset[index]
                                                                      .isSelect ==
                                                                  false
                                                              ? Row(
                                                                  children: [
                                                                    Text(interset[
                                                                            index]
                                                                        .icon),
                                                                    const SizedBox(
<<<<<<< HEAD
                                                                      width: 5,
=======
                                                                      width:
                                                                          5,
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                                                    ),
                                                                    Text(interset[
                                                                            index]
                                                                        .title),
                                                                  ],
                                                                )
                                                              : Row(
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      interset[
                                                                              index]
                                                                          .title,
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      width:
                                                                          5,
                                                                    ),
                                                                    Text(
                                                                      interset[index]
                                                                          .title,
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                        ),
                                                      ),
<<<<<<< HEAD
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              isExpanded: _expanded[0]),
                                          ExpansionPanel(
                                              headerBuilder:
                                                  (BuildContext context,
                                                      bool isActive) {
                                                return const ListTile(
                                                  leading: Icon(
                                                    Icons.date_range_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                  title: Text("Dates"),
                                                );
                                              },
                                              body: Column(
                                                children: [
                                                  ListTile(
                                                    title: const Text("Today"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[0],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[0] =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title:
                                                        const Text("Tommorow"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[1],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[1] =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title:
                                                        const Text("This Week"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[2],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[2] =
=======
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              isExpanded: _expanded[0]),
                                          ExpansionPanel(
                                              headerBuilder:
                                                  (BuildContext context,
                                                      bool isActive) {
                                                return const ListTile(
                                                  leading: Icon(
                                                    Icons.date_range_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                  title: Text("Dates"),
                                                );
                                              },
                                              body: Column(
                                                children: [
                                                  ListTile(
                                                    title:
                                                        const Text("Today"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[0],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[0] =
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
<<<<<<< HEAD
                                                        "This Weekend"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[3],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[3] =
=======
                                                        "Tommorow"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[1],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[1] =
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
<<<<<<< HEAD
                                                    title:
                                                        const Text("Next Week"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[4],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[4] =
=======
                                                    title: const Text(
                                                        "This Week"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[2],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[2] =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                        "This Weekend"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[3],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[3] =
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
<<<<<<< HEAD
=======
                                                        "Next Week"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[4],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[4] =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
                                                        "Next Weekend"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[5],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[5] =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                        "In The Month"),
                                                    trailing: Checkbox(
                                                      value: _eventDate[6],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _eventDate[6] =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              isExpanded: _expanded[1]),
                                          ExpansionPanel(
                                              headerBuilder:
                                                  (BuildContext context,
                                                      bool isActive) {
                                                return const ListTile(
                                                  leading: Icon(
                                                    Icons.location_on,
                                                    color: Colors.green,
                                                  ),
                                                  title: Text("Location"),
                                                );
                                              },
                                              body: TextField(
                                                controller:
                                                    _searchLocationController,
                                                decoration: const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText:
                                                        "Searching Location..."),
                                              ),
                                              isExpanded: _expanded[2])
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
<<<<<<< HEAD
                              ]),
                        ),
                        FutureBuilder<SearchEvents>(
                            future: _eventsModel,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: const [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.push_pin_sharp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            " Your sports",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            snapshot.data!.user.sports.total,
                                        itemBuilder: (context, index) =>
                                            BottomContainerOfEvents(
                                          img: snapshot.data!.user.sports
                                              .list[index].sport.image,
                                          nOfEvents: '0 Upcoming',
                                          title: snapshot.data!.user.sports
                                              .list[index].sport.name,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return Container(
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            offset: const Offset(0, 0.5))
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("We didn't find any results",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      Text(
                                          "Make sure everything is spelled correctly",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                      Text("or try different keywords.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                );
                              }
                            }),
                      ])),
            ),
          ),
        ));
=======
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.push_pin_sharp,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        " Your sports",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.user.sports.total,
                                  itemBuilder: (context, index) =>
                                      BottomContainerOfEvents(
                                    img: snapshot.data!.user.sports
                                        .list[index].sport.image,
                                    nOfEvents: '0 Upcoming',
                                    title: snapshot.data!.user.sports
                                        .list[index].sport.name,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
      ),
    );
>>>>>>> 14c31b76c26f3565eb8cd82b2ece894f5136ed96
  }

  void changeIndexCheckAll(int index) {
    if (interset[index].isSelect) {
      interset[index].isSelect = false;
      return;
    }
    for (int i = 0; i < interset.length; i++) {
      if (i == index) {
        interset[i].isSelect = true;
      } else {
        interset[i].isSelect = false;
      }
    }
  }
}

class BottomContainerOfEvents extends StatelessWidget {
  const BottomContainerOfEvents({
    Key? key,
    required this.title,
    required this.img,
    required this.nOfEvents,
  }) : super(key: key);
  final String title;
  final String img;
  final String nOfEvents;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 200,
        width: 300,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
            image: DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 0.5))
            ]),
        child: Stack(
          children: [
            Positioned(
                left: 20,
                bottom: 40,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            const Positioned(
                left: 20,
                bottom: 20,
                child: Text(
                  "0 Upcoming",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
