import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/API%20Manager/api_search_user.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/interset.dart';
import 'package:sportm4te/Models/user_search_model.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final TextEditingController _searchTextController = TextEditingController();
  final TextEditingController _searchLocationController =
      TextEditingController();
  late Future<UserSearchModel> _model;

  final List<bool> _expanded = [false, false];
  bool value = false;

  void showSearchresults() {
    setState(() {
      _model = UserSearchAPIManager().searchUser(
          Provider.of<DataManager>(context, listen: false).userToken,
          _searchTextController.text.toString());
    });
  }

  Future<UserSearchModel> refreshSearchresults() async {
    setState(() {
      _model = UserSearchAPIManager().showUser(
          Provider.of<DataManager>(context, listen: false).userToken, context);
    });
    return _model;
  }

  @override
  void initState() {
    _model = UserSearchAPIManager().showUser(
        Provider.of<DataManager>(context, listen: false).userToken, context);
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
                              autofillHints: const [AutofillHints.givenName],
                              onEditingComplete: showSearchresults,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
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
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: interset.length,
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
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
                                                                        1, 4))
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
                                                                  width: 5,
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
                                            controller:
                                                _searchLocationController,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText:
                                                    "Searching Location..."),
                                          ),
                                          isExpanded: _expanded[1])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    FutureBuilder<UserSearchModel>(
                        future: _model,
                        builder: (context, data) {
                          if (data.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data.data!.users.data.length,
                                itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.all(20),
                                    padding: const EdgeInsets.all(20),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              offset: const Offset(0, 0.5))
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowUserProfileUI(
                                                          userName: data
                                                              .data!
                                                              .users
                                                              .data[index]
                                                              .username,
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
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(1, 1))
                                                ]),
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(data
                                                  .data!
                                                  .users
                                                  .data[index]
                                                  .image),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          data.data!.users.data[index].username,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        if (data.data!.users.data[index].sports
                                            .isNotEmpty)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(fav),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: data
                                                            .data!
                                                            .users
                                                            .data[index]
                                                            .sports
                                                            .length >
                                                        5
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        1.4
                                                    : data
                                                                .data!
                                                                .users
                                                                .data[index]
                                                                .sports
                                                                .length <
                                                            3
                                                        ? 100
                                                        : 150,
                                                child: Text(
                                                  gameNames(data.data!.users
                                                      .data[index].sports),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '${data.data!.users.data[index].stats.friends}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '${data.data!.users.data[index].stats.hosting}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '${data.data!.users.data[index].stats.going}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
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
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  "Events",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  "Joined Events",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )));
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
                                ));
                          }
                        }),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  String gameNames(final data) {
    String name = '';
    for (var i = 0; i < data.length; i++) {
      name = name + data[i].sport.name + ',';
    }
    return name;
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
