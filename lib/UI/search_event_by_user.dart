import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sportm4te/Models/interset.dart';
import 'package:sportm4te/UI/show_user_profile_ui.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';

class SearchEventByUser extends StatefulWidget {
  const SearchEventByUser({Key? key}) : super(key: key);

  @override
  _SearchEventByUserState createState() => _SearchEventByUserState();
}

class _SearchEventByUserState extends State<SearchEventByUser> {
  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();
  final TextEditingController _searchTextController = TextEditingController();
  final TextEditingController _searchLocationController =
      TextEditingController();

  final List<bool> _expanded = [false, false, false];
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
              title: 'Search User',
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
                              hintText: "Searching by username"),
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
                              width: MediaQuery.of(context).size.width / 1.3,
                              margin:
                                  const EdgeInsets.only(left: 20, bottom: 10),
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
                                          title: Text("Favourite Sports"),
                                        );
                                      },
                                      body: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            height: 50,
                                            margin: const EdgeInsets.only(
                                                left: 10, bottom: 20),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: interset.length,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    changeIndexCheckAll(index);
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                      color: interset[index]
                                                                  .isSelect ==
                                                              false
                                                          ? Colors.white
                                                          : Colors.green,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  25)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    1, 4))
                                                      ]),
                                                  child: interset[index]
                                                              .isSelect ==
                                                          false
                                                      ? Row(
                                                          children: [
                                                            Text(interset[index]
                                                                .icon),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(interset[index]
                                                                .title),
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              interset[index]
                                                                  .title,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      isExpanded: _expanded[0]),
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
                      ],
                    )),
                Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShowUserProfileUI(
                                          userName: 'shazaib',
                                        )));
                          },
                          child: Container(
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
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://app.sportm4te.com/images/avatars/male.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Username",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Member Since 13-oct-2020",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          fav + " football, Run",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "0",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "1",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "2",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Friends",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Events",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Joined Events",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                          ],
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
