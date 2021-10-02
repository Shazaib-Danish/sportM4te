import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sportm4te/Models/address_search.dart';
import 'package:sportm4te/Models/google_search_auto.dart';

import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';
import 'package:uuid/uuid.dart';

class SearchEvent extends StatefulWidget {
  const SearchEvent({Key? key}) : super(key: key);

  @override
  _SearchEventState createState() => _SearchEventState();
}

class _SearchEventState extends State<SearchEvent> {
  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();
  final TextEditingController _searchTextController = TextEditingController();
  final TextEditingController _searchLocationController =
      TextEditingController();

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
  bool value = false;
  @override
  void dispose() {
    _searchLocationController.dispose();
    _searchTextController.dispose();
    super.dispose();
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
              title: 'Search',
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextField(
                          autofillHints: const [AutofillHints.oneTimeCode],
                          onSubmitted: (value) => _searchTextController,
                          controller: _searchTextController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Searching for something..."),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                          padding: EdgeInsets.all(10.0),
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
                              width: MediaQuery.of(context).size.width / 1.3,
                              margin: const EdgeInsets.only(left: 20),
                              child: ExpansionPanelList(
                                dividerColor: Colors.grey,
                                expansionCallback: (index, expanded) {
                                  setState(() {
                                    _expanded[index] = !expanded;
                                  });
                                },
                                children: [
                                  ExpansionPanel(
                                      headerBuilder: (BuildContext context,
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
                                        children: const [
                                          ListTile(
                                            title: Text("Body of Title"),
                                            subtitle: Text("Subtitle of body"),
                                            trailing: Icon(Icons.favorite),
                                          ),
                                          ListTile(
                                            title: Text("Body of Title"),
                                            subtitle: Text("Subtitle of body"),
                                            trailing: Icon(Icons.favorite),
                                          ),
                                          ListTile(
                                            title: Text("Body of Title"),
                                            subtitle: Text("Subtitle of body"),
                                            trailing: Icon(Icons.favorite),
                                          ),
                                          ListTile(
                                            title: Text("Body of Title"),
                                            subtitle: Text("Subtitle of body"),
                                            trailing: Icon(Icons.favorite),
                                          ),
                                        ],
                                      ),
                                      isExpanded: _expanded[0]),
                                  ExpansionPanel(
                                      headerBuilder: (BuildContext context,
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
                                                  _eventDate[0] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text("Tommorow"),
                                            trailing: Checkbox(
                                              value: _eventDate[1],
                                              onChanged: (value) {
                                                setState(() {
                                                  _eventDate[1] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text("This Week"),
                                            trailing: Checkbox(
                                              value: _eventDate[2],
                                              onChanged: (value) {
                                                setState(() {
                                                  _eventDate[2] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text("This Weekend"),
                                            trailing: Checkbox(
                                              value: _eventDate[3],
                                              onChanged: (value) {
                                                setState(() {
                                                  _eventDate[3] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text("Next Week"),
                                            trailing: Checkbox(
                                              value: _eventDate[4],
                                              onChanged: (value) {
                                                setState(() {
                                                  _eventDate[4] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text("Next Weekend"),
                                            trailing: Checkbox(
                                              value: _eventDate[5],
                                              onChanged: (value) {
                                                setState(() {
                                                  _eventDate[5] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text("In The Month"),
                                            trailing: Checkbox(
                                              value: _eventDate[6],
                                              onChanged: (value) {
                                                setState(() {
                                                  _eventDate[6] = value!;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      isExpanded: _expanded[1]),
                                  ExpansionPanel(
                                      headerBuilder: (BuildContext context,
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
                                        controller: _searchLocationController,
                                        readOnly: true,
                                        onTap: () async {
                                          final sessionToken =
                                              const Uuid().v4();
                                          Suggestion? result = await showSearch(
                                            context: context,
                                            delegate:
                                                AddressSearch(sessionToken),
                                          );
                                          if (result != null) {
                                            await PlaceApiProvider(sessionToken)
                                                .getPlaceDetailFromId(
                                                    result.placeId);
                                          }
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Searching Location..."),
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
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: const [
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
                              )
                            ],
                          ),
                        ),
                        const BottomContainerOfEvents(
                          img:
                              'https://app.sportm4te.com/images/sport/football.jpg',
                          nOfEvents: '0 Upcoming',
                          title: 'Football',
                        ),
                        const BottomContainerOfEvents(
                          img:
                              'https://app.sportm4te.com/images/sport/football.jpg',
                          nOfEvents: '0 Upcoming',
                          title: 'Football',
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
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
            color: Colors.white,
            image: DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 0.5))
            ]),
        child: Stack(
          children: const [
            Positioned(
                left: 20,
                bottom: 40,
                child: Text(
                  "Football",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                left: 20,
                bottom: 20,
                child: Text(
                  "0 Upcoming",
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
