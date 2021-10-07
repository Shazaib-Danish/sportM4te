import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/API%20Manager/api_event_details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/user_events_details.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';

class EventsDetails extends StatefulWidget {
  const EventsDetails({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  _EventsDetailsState createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  final GlobalKey<ScaffoldState> keyProfile = GlobalKey();
  late Future<UserMyEventsDetails> _eventsModel;

  @override
  void initState() {
    _eventsModel = EventDetailAPIManager().getUserEvents(
        Provider.of<DataManager>(context, listen: false).getUserToken,
        widget.id,
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
              title: 'Event',
              isEventDetail: false,
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
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
                  child: FutureBuilder<UserMyEventsDetails>(
                      future: _eventsModel,
                      builder: (context, data) {
                        if (data.hasData) {
                          return Stack(
                            children: [
                              Positioned(
                                  child: ListView.builder(
                                      itemCount: data.data!.members.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            if (data.data!.members[index]
                                                    .members !=
                                                null)
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                    data
                                                        .data!
                                                        .members[index]
                                                        .members![index]
                                                        .user
                                                        .image!),
                                              ),
                                            if (data.data!.members[index]
                                                    .members !=
                                                null)
                                              Text(data
                                                  .data!
                                                  .members[index]
                                                  .members![index]
                                                  .user
                                                  .username!),
                                            if (data.data!.members[index]
                                                    .score !=
                                                null)
                                              Text(data
                                                  .data!.members[index].score!),
                                          ],
                                        );
                                      })),
                              Positioned(
                                  height: 200,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                  child: Image.asset(
                                    'assets/map.jpg',
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                  bottom: 60,
                                  left: 100,
                                  child: Text(
                                    data.data!.event.location.formatted!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                              Positioned(
                                  bottom: 80,
                                  left: 130,
                                  child: IconButton(
                                      onPressed: () {
                                        MapUtils.openMap(
                                            data.data!.event.location.lat!,
                                            data.data!.event.location.lng!);
                                      },
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 50,
                                      )))
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
