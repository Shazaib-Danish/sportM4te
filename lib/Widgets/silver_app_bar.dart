import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';

class SilverAppbar extends StatelessWidget {
  const SilverAppbar({required this.appBarKey, required this.title, required this.isEventDetail});

  final GlobalKey<ScaffoldState> appBarKey;
  final String title;
  final bool isEventDetail;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 100.0,
        centerTitle: true,
        floating: false,
        iconTheme: Theme.of(context).primaryIconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
            )),
        pinned: true,
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
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    // top > 71 && top < 91
                    //     ? InkWell(
                    //         child: const Icon(
                    //           Icons.share,
                    //           size: 20.0,
                    //         ),
                    //         onTap: () {
                    //           appBarKey.currentState!.openDrawer();
                    //         },
                    //       )
                    //     : InkWell(
                    //         onTap: () {},
                    //         child: Material(
                    //             elevation: 5.0,
                    //             borderRadius: BorderRadius.circular(12.0),
                    //             child: const Padding(
                    //               padding: EdgeInsets.all(6.0),
                    //               child: Icon(
                    //                 Icons.menu,
                    //                 size: 15.0,
                    //               ),
                    //             )),
                    //       ),
                    top > 71 && top < 91
                        ? InkWell(
                            onTap: () {
                              final themeMode =
                                  Provider.of<DataManager>(context, listen: false).themeMode;
                              // ignore: unrelated_type_equality_checks
                              if (themeMode == ThemeMode.light) {
                                Provider.of<DataManager>(context, listen: false).changeTheme(true);
                              } else {
                                Provider.of<DataManager>(context, listen: false).changeTheme(false);
                              }
                            },
                            child: Provider.of<DataManager>(context).isLightMode
                                ? const Icon(
                                    Icons.wb_incandescent,
                                    color: Colors.yellow,
                                    size: 25.0,
                                  )
                                : const Icon(
                                    Icons.nightlight_round,
                                    size: 25.0,
                                  ),
                          )
                        : InkWell(
                            onTap: () {
                              final themeMode =
                                  Provider.of<DataManager>(context, listen: false).themeMode;
                              // ignore: unrelated_type_equality_checks
                              if (themeMode == ThemeMode.light) {
                                Provider.of<DataManager>(context, listen: false).changeTheme(true);
                              } else {
                                Provider.of<DataManager>(context, listen: false).changeTheme(false);
                              }
                            },
                            child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(12.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Provider.of<DataManager>(context).isLightMode
                                      ? const Icon(
                                          Icons.wb_incandescent,
                                          color: Colors.yellow,
                                          size: 15.0,
                                        )
                                      : const Icon(
                                          Icons.nightlight_round,
                                          size: 15.0,
                                        ),
                                )),
                          ),
                     SizedBox(
                      width: top > 71 && top < 91 ? 15.0 : 10,
                    ),
                    top > 71 && top < 91
                        ? InkWell(
                            child: const Icon(
                              Icons.menu,
                              size: 25.0,
                            ),
                            onTap: () {
                              appBarKey.currentState!.openDrawer();
                            },
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
