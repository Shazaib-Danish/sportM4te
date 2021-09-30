import 'package:flutter/material.dart';
import 'package:sportm4te/API%20Manager/login_api_manager.dart';
import 'package:sportm4te/API%20Manager/my_envents_api.dart';
import 'package:sportm4te/Models/user_model.dart';
import 'package:sportm4te/Models/user_my_events.dart';
import 'package:sportm4te/Models/user_my_events_details.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  late Future<Host> _eventsModel;

  @override
  void initState() {
    // _eventsModel = MyEventsApiManager().myEvents(
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLnNwb3J0bTR0ZS5jb21cL3YxLjBcL3VzZXJcL2xvZ2luIiwiaWF0IjoxNjMyODU4MTM1LCJleHAiOjE2MzU0NTAxMzUsIm5iZiI6MTYzMjg1ODEzNSwianRpIjoicFJGbWd2eHZNZjBDQ0xkaCIsInN1YiI6MiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.g14Gm608vo3NWfIDZuy9JhLgHmeRtndT_-SVP0-h0rg');
    // _eventsModel = UserLoginApiManager().login('caplarobko@gmail.com', 'mamsafajn', context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<Host>(
        future: _eventsModel,
        builder: (context, data) {
          if (data.hasData) {
            return ListView.builder(
                itemCount: data.data!.event.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(data.data!.event),
                    ],
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
