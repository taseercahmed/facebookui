import 'package:badges/badges.dart';
import 'package:facebookui/Widgets/Emaillogin.dart';
import 'package:facebookui/pages/FriendPage.dart';
import 'package:facebookui/pages/HomePage.dart';
import 'package:facebookui/pages/MarketPage.dart';
import 'package:facebookui/pages/Messaging.dart';
import 'package:facebookui/pages/MyDrawer.dart';
import 'package:facebookui/pages/NotificationPage.dart';
import 'package:facebookui/pages/VideoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTab extends StatefulWidget {
  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> toptab = <Tab>[
    Tab(icon: Icon(Icons.home_outlined)),
    Tab(icon: Icon(Icons.people_outlined)),
    Tab(icon: Icon(Icons.message_outlined)),
    Tab(
      text: "EmailLogin",
    ),
    Tab(
      icon: Badge(
        child: Icon(Icons.notifications_outlined),
        position: BadgePosition.topEnd(top: -20, end: -5),
        badgeContent: Text(
          "3",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    ),
    Tab(icon: Icon(Icons.video_library_outlined)),
    Tab(icon: Icon(Icons.shopping_bag_outlined)),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: toptab.length, initialIndex: 0, vsync: this);
    super.initState();
  }

  Future<bool> _onwillpop() async {
    print("On Pop Up");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(Duration(microseconds: 200), () {
      print("Set Index");
      _tabController?.index = 0;
    });
    print("On index");
    return _tabController?.index == 0;
  }

  final _scafoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillpop,
      child: Scaffold(
          key: _scafoldkey,
          appBar: AppBar(
            title: Text(
              "Facebbok",
              style: TextStyle(fontSize: 20, color: Colors.blue[700]),
            ),
            backgroundColor: Colors.white,
            actions: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    print("Search Boutton Click");
                  },
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: IconButton(
                    icon: Icon(Icons.menu),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      // if(_scafoldkey.currentState!=null){
                      //
                      // }
                      _scafoldkey.currentState!.openEndDrawer();
                    }),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              )
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              tabs: toptab,
            ),
          ),
          endDrawer: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            child: MyDrawer(),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              HomePage(),
              FriendPage(),
              Messaging(),
              Emaillogin(),
              NotificationPage(),
              VideoPage(),
              MarketPage(),
            ],
          )),
    );
  }
}
