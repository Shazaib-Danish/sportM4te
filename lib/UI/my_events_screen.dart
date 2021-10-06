import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:sportm4te/API%20Manager/my_envents_api.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';

import 'package:sportm4te/Models/user_my_events.dart';
import 'package:sportm4te/UI/event_deatil.dart';

import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
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
                title: 'My Events',
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ]),
                  child: const MyWidget(),
                ),
              ),
            ],
          ),
        ));
  }
}

enum _Tab {
  Hosting,
  Upcoming,
  Going,
  PastEvents,
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  _Tab _selectedTab = _Tab.Hosting;
  late Future<UserMyEvents> _eventsModel;
  @override
  void initState() {
    _eventsModel = MyEventAPIManager().getUserEvents(
        Provider.of<DataManager>(context, listen: false).getUserToken, context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 15,
        ),
        CupertinoSegmentedControl<_Tab>(
          selectedColor: Colors.green,
          borderColor: Colors.grey,
          pressedColor: Colors.grey,
          children: const {
            _Tab.Hosting: Text(
              'Hosting',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontStyle: FontStyle.italic),
            ),
            _Tab.Upcoming: Text(
              'Upcoming',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            _Tab.Going: Text(
              'Going',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            _Tab.PastEvents: Text(
              'Past Event',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          },
          onValueChanged: (value) {
            setState(() {
              _selectedTab = value;
            });
          },
          groupValue: _selectedTab,
        ),
        Expanded(
          child: FutureBuilder<UserMyEvents>(
            future: _eventsModel,
            builder: (context, data) {
              if (data.hasData) {
                switch (_selectedTab) {
                  case _Tab.Hosting:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                          child: ListViewOfEventsHosting(
                            data: data.data!.hosting,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 25.0, left: 8),
                          child: Text(
                            "Hosted Events",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: ListViewOfEventsHosting(
                            data: data.data!.hosted,
                          ),
                        ),
                      ],
                    );
                  case _Tab.Upcoming:
                    return ListViewOfEventsHosting(
                      data: data.data!.upcoming,
                    );
                  case _Tab.Going:
                    return ListViewOfEventsGoing(
                      data: data.data!.going,
                    );
                  case _Tab.PastEvents:
                    return ListViewOfEventsGoing(
                      data: data.data!.pastEvents,
                    );
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
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EventsDetails(id: data[index].id)));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data[index].owner.sports[index].sport.image,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 70,
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
                                data[index].dates.oneline,
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
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          )
        : const Center(child: Text("You don't have any events"));
  }
}

class ListViewOfEventsGoing extends StatelessWidget {
  const ListViewOfEventsGoing({
    Key? key,
    required this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EventsDetails(id: data[index].id)));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data[index].user.sports[index].sport.image,
                          fit: BoxFit.cover,
                          height: 80,
                          width: 70,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].user.sports[index].sport.slug,
                            ),
                            Text(
                              data[index].user.username,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'data[index].dates.oneline',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text(
                                  data[index].user.location.formatted == null
                                      ? ""
                                      : data[index].user.location.formatted!,
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : const Center(child: Text("You don't have any events"));
  }
}
