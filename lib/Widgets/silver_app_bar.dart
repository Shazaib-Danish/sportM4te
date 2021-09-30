import 'package:flutter/material.dart';

class SilverAppbar extends StatelessWidget {
  const SilverAppbar({Key? key, required this.appBarKey, required this.title}) : super(key: key);

  final GlobalKey<ScaffoldState> appBarKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 100.0,
        centerTitle: true,
        floating: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            )),
        pinned: true,
        backgroundColor: Colors.white,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var top = constraints.biggest.height;
            return FlexibleSpaceBar(
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  children: [
                    top > 71 && top < 91 ? const Spacer() : const Text(''),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    top > 71 && top < 91
                        ? const Icon(
                            Icons.nightlight_round,
                            size: 20.0,
                          )
                        : Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(12.0),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.nightlight_round,
                                size: 15.0,
                              ),
                            )),
                    const SizedBox(
                      width: 10.0,
                    ),
                    top > 71 && top < 91
                        ? const Icon(
                            Icons.menu,
                            size: 20.0,
                          )
                        : InkWell(
                            onTap: () {
                              appBarKey.currentState!.openDrawer();
                            },
                            child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(12.0),
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.menu,
                                    size: 15.0,
                                  ),
                                )),
                          ),
                  ],
                ),
              ),
              background: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            );
          },
        ));
  }
}
