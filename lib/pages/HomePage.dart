import 'package:facebookui/Widgets/MenuBar.dart';
import 'package:facebookui/Widgets/PostBar.dart';
import 'package:facebookui/Widgets/StoryBar.dart';
import 'package:facebookui/pages/Post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: [
          PostBar(),
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          MenuBar(),
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          StoryBar(),
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          Post(),
        ],
      ),
    ));
  }
}
