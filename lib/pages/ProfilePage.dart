// import 'dart:html';

import 'dart:io';

import 'package:facebookui/Widgets/MenuBar.dart';
import 'package:facebookui/Widgets/PostBar.dart';
import 'package:facebookui/pages/Post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final image = ImagePicker();
  late File file;

  void getimage() {
    // file=image.getImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Text(
                "Dawin morgan",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 255,
              width: 400,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  GestureDetector(
                    onTap: () {
                      // getImage();
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: 400,
                          margin: EdgeInsets.only(top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image(
                              image: AssetImage("images/natural.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 10.0,
                      left: 140,
                      child: Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          child: Image(
                            image: AssetImage("images/dawin.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Dawin Morgan",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.add_circle),
                        Text("Add to Story"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.book),
                      Text(
                        "All Book is available for collage and university",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.gamepad),
                      Text(
                        "Single",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.info),
                      Text(
                        "About",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "friends",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "find friends",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black26,
            ),
            PostBar(),
            MenuBar(),
            Post(),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
