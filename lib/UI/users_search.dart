import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/user_search_model.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:sportm4te/Widgets/silver_app_bar.dart';

class UsersSearch extends StatelessWidget {
   UsersSearch({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> keyUserSearch = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyUserSearch,
      drawer: const Drawer(
        child: Draawer(),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SilverAppbar(appBarKey: keyUserSearch,title: 'Search Users',),
            ];
          },
          body: FutureBuilder<Users>(
            future: Provider.of<DataManager>(context, listen: false).getSearchUsersList,
            builder: (context, data) {
              return ListView.builder(
                  itemCount: data.data!.total,
                  itemBuilder: (context, index){
                return Text(data.data!.data[index].username);
              });
            }
          )
      ),
    );
  }
}
