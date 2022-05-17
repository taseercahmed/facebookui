import 'package:facebookui/User/Change_pass.dart';
import 'package:facebookui/User/Dashboard.dart';
import 'package:facebookui/User/Profile.dart';
import 'package:flutter/material.dart';

class UserMain extends StatefulWidget {
  const UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int indexcode = 0;
  static List<Widget> widgetoption = <Widget>[
    Dashboard(),
    Profile(),
    Changepass(),
  ];

  void onitemtap(int index) {
    setState(() {
      indexcode = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetoption.elementAt(indexcode),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "ChangePassword",
            ),
          ],
          currentIndex: indexcode,
          selectedItemColor: Colors.blue,
          onTap: onitemtap,
        ));
  }
}
