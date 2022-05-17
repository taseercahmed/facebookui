import 'package:facebookui/pages/MarketPage.dart';
import 'package:facebookui/pages/Messaging.dart';
import 'package:facebookui/pages/ProfilePage.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          child: DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  // splashColor: Colors.red,
                  // highlightColor: Colors.blue,
                ),
                Text(
                  "Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
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
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/dawin.jpg"),
              ),
              title: Text(
                "Dawin morgan",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("View your Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(
                Icons.coronavirus_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Covid 19 Information Center",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.green,
              ),
              title: Text(
                "Messages",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Messaging(),
                              ),
                            )));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: Colors.blue,
              ),
              title: Text(
                "Groups",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.red,
              ),
              title: Text(
                "Market place",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: MarketPage(),
                              ),
                            )));
              },
            ),
          ],
        ))
      ],
    ));
  }
}
